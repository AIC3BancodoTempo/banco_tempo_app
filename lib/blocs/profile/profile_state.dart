part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class SuccessState extends ProfileState {
  final String message;

  SuccessState({@required this.message});
  @override
  List<Object> get props => [message];
}

class FailState extends ProfileState {
  final String message;

  FailState({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingEndState extends ProfileState {}

class LoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {}
