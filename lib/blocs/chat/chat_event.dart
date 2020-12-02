part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatStartedEvent extends ChatEvent {}

class ReportEvent extends ChatEvent {}

class ExchangeEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;

  SendMessageEvent({@required this.message});
}
