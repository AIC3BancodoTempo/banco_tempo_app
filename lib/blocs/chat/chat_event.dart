part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatStartedEvent extends ChatEvent {}

class ReceivedEvent extends ChatEvent {
  final String messageId, userId, fromId;
  final bool visualizado;
  ReceivedEvent({this.fromId, this.visualizado, this.userId, this.messageId});
  @override
  List<Object> get props => [messageId, userId, fromId, visualizado];
}

class SendMessageEvent extends ChatEvent {
  final String message;
  SendMessageEvent({
    this.message,
  });
  @override
  List<Object> get props => [message];
}

class SendImageEvent extends ChatEvent {
  final File imageFile;
  SendImageEvent({
    this.imageFile,
  });
  @override
  List<Object> get props => [imageFile];
}

class ExchangeEvent extends ChatEvent {
  final String id;

  ExchangeEvent({this.id});
}

class RequestExchangeEvent extends ChatEvent {}

class ReportEvent extends ChatEvent {
  final String report;

  ReportEvent({this.report});

  @override
  List<Object> get props => [report];
}

class GetMoreMessagesEvent extends ChatEvent {}
