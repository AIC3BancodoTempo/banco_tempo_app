part of 'hability_description_bloc.dart';

abstract class HabilityDescriptionEvent extends Equatable {
  const HabilityDescriptionEvent();

  @override
  List<Object> get props => [];
}

class StartedEvent extends HabilityDescriptionEvent {}

class ChatPressedEvent extends HabilityDescriptionEvent {}
