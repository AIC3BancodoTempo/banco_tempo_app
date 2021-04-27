part of 'add_service_bloc.dart';

abstract class AddServiceState extends Equatable {
  const AddServiceState();

  @override
  List<Object> get props => [];
}

class AddServiceInitial extends AddServiceState {}

class LoadingAddServiceState extends AddServiceState {}

class LoadedState extends AddServiceState {}

class UpdateTipoState extends AddServiceState {}

class FailState extends AddServiceState {
  final String message;

  FailState({@required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessState extends AddServiceState {}
