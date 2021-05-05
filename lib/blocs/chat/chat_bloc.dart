import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/chat_model.dart';
import '../../core/models/exchange_model.dart';
import '../../core/models/service_model.dart';
import '../../core/models/user_model.dart';
import '../../resources/chat/firestore_chat.dart';
import '../../resources/exchange/firestore_exchange.dart';
import '../../resources/messaging/firebase_messaging.dart';
import '../../resources/report/firebase_report.dart';
import '../../resources/service/firestore_service.dart';
import '../../resources/storage/firebase_storage.dart';
import '../../resources/tokens/firestore_tokens.dart';
import '../../resources/user/firebase_user.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository = ChatRepository();
  final UsersRepository _usersRepository = UsersRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final ReportRepository _reportRepository = ReportRepository();

  final MessagingRepository _messagingRepository = MessagingRepository();
  final TokenRepository _tokenRepository = TokenRepository();
  final ExchangeRepository _exchangeRepository = ExchangeRepository();

  final ServiceRepository _serviceRepository = ServiceRepository();
  final UserModel userModel;
  final User user;
  final ExchangeModel exchangeModel;
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
    this.exchangeModel,
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
        if (exchangeModel.salaId.isNotEmpty) {
          chatList =
              await _chatRepository.getLastMessages(exchangeModel.salaId);
          noReport =
              await _reportRepository.existeReport(user.uid, exchangeModel.key);
          Stream<QuerySnapshot> messages =
              await _chatRepository.receiveOneMessage(exchangeModel.salaId);
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
          _chatRepository.receivedCheck(exchangeModel.salaId, event.messageId);
        }
        yield UpdateMessagesState();
        yield ShowMessagesState();
      } else if (event is SendMessageEvent) {
        ChatModel chat = ChatModel(
            content: event.message,
            fromId: user.uid,
            type: 0,
            timestamp: DateTime.now().millisecondsSinceEpoch.toString());
        _chatRepository.addChat(exchangeModel.salaId, chat);
        _messagingRepository.sendMessage(
            token, user.displayName, event.message);
      } else if (event is SendImageEvent) {
        imageFile = event.imageFile;
      } else if (event is GetMoreMessagesEvent) {
        int lenght = chatList.length;
        if (!noMore) {
          chatList += await _chatRepository.getMoreMessages(
              exchangeModel.salaId, chatList.last.documentSnapshot);
          yield UpdateMessagesState();
        }
        if (lenght == chatList.length) noMore = true;
        yield ShowMessagesState();
      } else if (event is ReportEvent) {
        if (!noReport) {
          String reportedId, reportedName = '';
          if (user.uid == exchangeModel.userConsumerId) {
            reportedId = exchangeModel.userPostId;
            reportedName = exchangeModel.userPostName;
          } else {
            reportedId = exchangeModel.userConsumerId;
            reportedName = exchangeModel.userConsumerName;
          }
          noReport = await _reportRepository.insertExchange(
              reportedId,
              reportedName,
              event.report,
              exchangeModel.key,
              user.uid,
              user.displayName);
        }
        yield WarningState(message: "Report enviado com sucesso!");
        yield ShowMessagesState();
      } else if (event is RequestExchangeEvent) {
        if (exchangeModel.status == 0 && !noExchange) {
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
          _chatRepository.addChat(exchangeModel.salaId, chat);
          noExchange = true;
        } else {
          yield WarningState(
              message: "Requisição de troca só pode ser feito uma vez!");
        }
      } else if (event is ExchangeEvent) {
        double horasTroca = exchangeModel.cost * exchangeModel.amount;
        if (userModel.horas >= horasTroca) {
          ServiceModel service =
              await _serviceRepository.getServiceById(exchangeModel.productId);
          if (service != null) {
            int restante = service.productQuantity - exchangeModel.amount;
            if (restante >= 0) {
              await _usersRepository.addHoras(
                  exchangeModel.userPostId, horasTroca);
              await _usersRepository.removeHoras(
                  exchangeModel.userConsumerId, horasTroca);
              userModel.horas -= horasTroca;
              await _exchangeRepository.concluiExchange(exchangeModel.key);
              if (restante == 0) {
                await _serviceRepository.updateStatus(
                    exchangeModel.productId, 2);
              } else {
                await _serviceRepository.decrementaQuantidade(
                    exchangeModel.productId, exchangeModel.amount);
              }
              int index =
                  chatList.indexWhere((element) => event.id == element.key);
              if (index >= 0) {
                chatList[index].type = 2;
                ChatModel tmp = chatList[index];
                chatList.removeAt(index);
                chatList.insert(index, tmp);
                _chatRepository.updateChat(exchangeModel.salaId, event.id, 2);
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
