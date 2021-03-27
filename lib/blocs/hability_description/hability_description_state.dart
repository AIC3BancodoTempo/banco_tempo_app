part of 'hability_description_bloc.dart';

abstract class HabilityDescriptionState extends Equatable {
  const HabilityDescriptionState();

  @override
  List<Object> get props => [];
}

class HabilityDescriptionInitial extends HabilityDescriptionState {}

class ChatPressedState extends HabilityDescriptionState {
  final TrocaModel trocaModel;

  ChatPressedState({this.trocaModel});
}

class ShowScreenState extends HabilityDescriptionState {}

class LoadingScreenState extends HabilityDescriptionState {}

class WarningState extends HabilityDescriptionState {
  final String message;

  WarningState({this.message});
}
