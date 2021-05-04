part of 'service_description_bloc.dart';

abstract class ServiceDescriptionState extends Equatable {
  const ServiceDescriptionState();

  @override
  List<Object> get props => [];
}

class ServiceDescriptionInitial extends ServiceDescriptionState {}

class ChatPressedState extends ServiceDescriptionState {
  final ExchangeModel exchangeModel;

  ChatPressedState({this.exchangeModel});
}

class ShowScreenState extends ServiceDescriptionState {}

class LoadingScreenState extends ServiceDescriptionState {}

class WarningState extends ServiceDescriptionState {
  final String message;

  WarningState({this.message});
}
