part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatStartedEvent extends ChatEvent {}

class ReportEvent extends ChatEvent {
  final String report;

  ReportEvent({@required this.report});
}

class ExchangeEvent extends ChatEvent {}

class UploadImageEvent extends ChatEvent {
  final File image;

  UploadImageEvent({@required this.image});
}

class SendMessageEvent extends ChatEvent {
  final String message;

  SendMessageEvent({@required this.message});
}
