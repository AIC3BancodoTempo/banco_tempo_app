import 'dart:async';
import 'dart:io';

import 'package:banco_do_tempo_app/core/models/chat_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final User user;
  ChatBloc({@required this.user}) : super(ChatInitial());
  List<ChatModel> chatList = [];
  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is ChatStartedEvent) {
      yield LoadingState();
      yield ShowMessageState();
    } else if (event is SendMessageEvent) {
      print(event.message);
    } else if (event is ReportEvent) {
      print(event.report);
    } else if (event is ExchangeEvent) {
    } else if (event is UploadImageEvent) {
      if (event.image != null) {
        print('image received');
      }
    }
  }
}
