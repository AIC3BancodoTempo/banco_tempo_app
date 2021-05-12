part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class SubmitButtonPressed extends ProfileEvent {}

class ScreenStarded extends ProfileEvent {}

class SendPasswordRecover extends ProfileEvent {}
