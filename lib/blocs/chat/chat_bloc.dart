import 'dart:async';
import 'dart:io';

import 'package:banco_do_tempo_app/core/models/produto_model.dart';
import 'package:banco_do_tempo_app/resources/messaging/firebase_messaging.dart';
import 'package:banco_do_tempo_app/resources/tokens/firestore_tokens.dart';
import 'package:banco_do_tempo_app/resources/hability/firestore_hability.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/chat_model.dart';
import '../../core/models/troca_model.dart';
import '../../core/models/user_model.dart';
import '../../resources/chat/firestore_chat.dart';
import '../../resources/report/firebase_report.dart';
import '../../resources/storage/firebase_storage.dart';
import '../../resources/troca/firestore_troca.dart';
import '../../resources/user/firebase_user.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository = ChatRepository();
  final UsersRepository _usersRepository = UsersRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final ReportRepository _reportRepository = ReportRepository();
  final TrocaRepository _trocaRepository = TrocaRepository();
  final MessagingRepository _messagingRepository = MessagingRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  final HabilityRepository _habilityRepository = HabilityRepository();
  final UserModel userModel;
  final User user;
  final TrocaModel trocaModel;
  String token;
  File imageFile;
  String tokenuser;
  bool noMore = false;
  bool noReport = false;
  bool noExchange = false;
  List<ChatModel> chatList = [];
  StreamSubscription _subscription;
  ChatBloc({
    this.userModel,
    this.user,
    this.trocaModel,
  }) : super(ChatInitial());

  setNoExchange() {
    noExchange = true;
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    try {
      if (event is ChatStartedEvent) {
        yield LoadingState();
        if (trocaModel.salaId.isNotEmpty) {
          chatList = await _chatRepository.getLastMessages(trocaModel.salaId);
          noReport =
              await _reportRepository.existeReport(user.uid, trocaModel.key);
          Stream<QuerySnapshot> messages =
              await _chatRepository.receiveOneMessage(trocaModel.salaId);
          tokenuser = await _tokenRepository.getToken(user.uid);
          _subscription = messages.listen((event) {
            event.docs.forEach((element) {
              Map<String, dynamic> data = element.data();
              ChatModel chat = ChatModel.fromSnapshot(data, element);
              int index =
                  chatList.indexWhere((element) => chat.key == element.key);
              if (index >= 0)
                chatList[index] = chat;
              else
                chatList.insert(0, chat);
              add(ReceivedEvent(
                  messageId: chat.key,
                  userId: user.uid,
                  fromId: chat.fromId,
                  visualizado: chat.visualizado));
            });
          });
        }
        yield ShowMessagesState();
      } else if (event is ReceivedEvent) {
        if (event.userId != event.fromId && event.visualizado == false) {
          _chatRepository.receivedCheck(trocaModel.salaId, event.messageId);
        }
        yield UpdateMessagesState();
        yield ShowMessagesState();
      } else if (event is SendMessageEvent) {
        ChatModel chat = ChatModel(
            content: event.message,
            fromId: user.uid,
            type: 0,
            timestamp: DateTime.now().millisecondsSinceEpoch.toString());
        _chatRepository.addChat(trocaModel.salaId, chat);
        _messagingRepository.sendMessage(
            token, user.displayName, event.message);
      } else if (event is SendImageEvent) {
        imageFile = event.imageFile;
      } else if (event is GetMoreMessagesEvent) {
        int lenght = chatList.length;
        if (!noMore) {
          chatList += await _chatRepository.getMoreMessages(
              trocaModel.salaId, chatList.last.documentSnapshot);
          yield UpdateMessagesState();
        }
        if (lenght == chatList.length) noMore = true;
        yield ShowMessagesState();
      } else if (event is ReportEvent) {
        if (!noReport) {
          String reportedId, reportedName = '';
          if (user.uid == trocaModel.userConsumerId) {
            reportedId = trocaModel.userPostId;
            reportedName = trocaModel.userPostName;
          } else {
            reportedId = trocaModel.userConsumerId;
            reportedName = trocaModel.userConsumerName;
          }
          noReport = await _reportRepository.insertTroca(
              reportedId,
              reportedName,
              event.report,
              trocaModel.key,
              user.uid,
              user.displayName);
        }
        yield WarningState(message: "Report enviado com sucesso!");
        yield ShowMessagesState();
      } else if (event is RequestExchangeEvent) {
        if (trocaModel.status == 0 && !noExchange) {
          String image = '';
          if (imageFile != null) {
            image = await _storageRepository.sendChatFile(
                imageFile.readAsBytesSync(),
                DateTime.now().millisecondsSinceEpoch.toString());
          }
          ChatModel chat = ChatModel(
              content: "Confirmação de troca",
              url: image,
              fromId: user.uid,
              type: 1,
              timestamp: DateTime.now().millisecondsSinceEpoch.toString());
          _chatRepository.addChat(trocaModel.salaId, chat);
          noExchange = true;
        } else {
          yield WarningState(
              message: "Requisição de troca só pode ser feito uma vez!");
        }
      } else if (event is ExchangeEvent) {
        double horasTroca = trocaModel.cost * trocaModel.amount;
        if (userModel.horas >= horasTroca) {
          ProdutoModel produto =
              await _habilityRepository.getHabilityById(trocaModel.productId);
          if (produto != null) {
            int restante = produto.productQuantity - trocaModel.amount;
            if (restante >= 0) {
              await _usersRepository.addHoras(
                  trocaModel.userPostId, horasTroca);
              await _usersRepository.removeHoras(
                  trocaModel.userConsumerId, horasTroca);
              userModel.horas -= horasTroca;
              await _trocaRepository.concluiTroca(trocaModel.key);
              if (restante == 0) {
                await _habilityRepository.updateStatus(trocaModel.productId, 2);
              } else {
                await _habilityRepository.decrementaQuantidade(
                    trocaModel.productId, trocaModel.amount);
              }
              int index =
                  chatList.indexWhere((element) => event.id == element.key);
              if (index >= 0) {
                chatList[index].type = 2;
                ChatModel tmp = chatList[index];
                chatList.removeAt(index);
                chatList.insert(index, tmp);
                _chatRepository.updateChat(trocaModel.salaId, event.id, 2);
              }
              yield WarningState(message: "Troca realizada com sucesso!");
              yield ShowMessagesState();
            } else {
              yield WarningState(
                  message: "O produto não tem mais a quantidade desejada!");
            }
          } else {
            yield WarningState(
                message:
                    "O produto não foi encontrado, pode ter sido removido!");
          }
        } else {
          yield WarningState(
              message: "Você não tem horas suficientes para realizar a troca!");
        }
      }
    } catch (e) {
      print(e.toString());
      yield WarningState(message: "Algo saiu errado!");
    }
  }
}
