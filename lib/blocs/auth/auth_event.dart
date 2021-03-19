part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStartedEvent extends AuthEvent {}

class LoginEmailEvent extends AuthEvent {
  final String email;
  final String senha;

  LoginEmailEvent({@required this.email, @required this.senha});
}

class CreateLoginEmailEvent extends AuthEvent {
  final String email;
  final String senha;

  CreateLoginEmailEvent({@required this.email, @required this.senha});
}

class LogoutEvent extends AuthEvent {}

class SignupEvent extends AuthEvent {}

class ExitEvent extends AuthEvent {}

class ForgotEvent extends AuthEvent {}

class LoginSuccessEvent extends AuthEvent {
  final User user;

  LoginSuccessEvent({@required this.user});
}

class LoginEvent extends AuthEvent {}
