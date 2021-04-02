import 'dart:async';
import 'dart:io';

import '../../resources/report/firebase_report.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/chat_model.dart';
import '../../core/models/troca_model.dart';
import '../../resources/chat/firestore_chat.dart';
import '../../resources/storage/firebase_storage.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository = ChatRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final ReportRepository _reportRepository = ReportRepository();
  final User user;
  final TrocaModel trocaModel;
  File imageFile;
  String tokenuser;
  bool noMore = false;
  bool noReport = false;
  bool noExchange = false;
  List<ChatModel> chatList = [];
  StreamSubscription _subscription;
  ChatBloc({
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
          String image = await _storageRepository.sendChatFile(
              imageFile.readAsBytesSync(),
              DateTime.now().millisecondsSinceEpoch.toString());
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
        //TODO UPDATE STATUS SET HOURS FOR PARTICIPANTS
      }
    } catch (e) {
      print(e.toString());
      yield WarningState(message: "Algo saiu errado!");
    }
  }
}
