part of 'add_service_bloc.dart';

abstract class AddServiceEvent extends Equatable {
  const AddServiceEvent();

  @override
  List<Object> get props => [];
}

class SubmitButtonPressed extends AddServiceEvent {}

class AddServiceStartedEvent extends AddServiceEvent {}

class DisposeEvent extends AddServiceEvent {}

class RestartEvent extends AddServiceEvent {}
