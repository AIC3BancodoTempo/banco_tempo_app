import 'dart:async';
import 'dart:io';

import 'package:banco_do_tempo_app/core/models/chat_model.dart';
import 'package:banco_do_tempo_app/core/models/troca_model.dart';
import 'package:banco_do_tempo_app/resources/chat/firestore_chat.dart';
import 'package:banco_do_tempo_app/resources/storage/firebase_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository = ChatRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final User user;
  final TrocaModel trocaModel;
  String tokenuser;
  List<ChatModel> chatList = [];
  StreamSubscription _subscription;
  ChatBloc({
    this.user,
    this.trocaModel,
  }) : super(ChatInitial());
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is ChatStartedEvent) {
      yield LoadingState();
      if (trocaModel.salaId.isNotEmpty) {
        chatList = await _chatRepository.getLastMessages(trocaModel.salaId);
        Stream<QuerySnapshot> messages =
            await _chatRepository.receiveOneMessage(trocaModel.salaId);
        _subscription = messages.listen((event) {
          event.docs.forEach((element) {
            Map<String, dynamic> data = element.data();
            ChatModel chat = ChatModel.fromSnapshot(data, element);
            int index =
                chatList.indexWhere((element) => chat.key == element.key);
            if (index > 0)
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
      String image = await _storageRepository.sendChatFile(
          event.imageFile.readAsBytesSync(),
          DateTime.now().millisecondsSinceEpoch.toString());
      ChatModel chat = ChatModel(
          content: "",
          url: image,
          fromId: user.uid,
          type: 2,
          timestamp: DateTime.now().millisecondsSinceEpoch.toString());
      _chatRepository.addChat(trocaModel.salaId, chat);
    } else if (event is GetMoreMessagesEvent) {
      chatList += await _chatRepository.getMoreMessages(
          trocaModel.salaId, chatList.last.documentSnapshot);
      yield UpdateMessagesState();
      yield ShowMessagesState();
    }
  }
}
