import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial());

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
    } else if (event is ExchangeEvent) {}
  }
}
