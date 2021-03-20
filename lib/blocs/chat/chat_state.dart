part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class LoadingState extends ChatState {
  @override
  List<Object> get props => [];
}

class ShowMessagesState extends ChatState {}

class UpdateMessagesState extends ChatState {}
