part of 'service_description_bloc.dart';

abstract class ServiceDescriptionEvent extends Equatable {
  const ServiceDescriptionEvent();

  @override
  List<Object> get props => [];
}

class StartedEvent extends ServiceDescriptionEvent {}

class ChatPressedEvent extends ServiceDescriptionEvent {}
