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
  final String nome;

  CreateLoginEmailEvent(
      {@required this.email, @required this.senha, @required this.nome});
}

class LogoutEvent extends AuthEvent {}

class SignupEvent extends AuthEvent {}

class QuestionaryEvent extends AuthEvent {}

class ExitEvent extends AuthEvent {}

class ToWelcomeEvent extends AuthEvent {}

class ForgotEvent extends AuthEvent {}

class LoginSuccessEvent extends AuthEvent {
  final User user;

  LoginSuccessEvent({@required this.user});
}

class LoginEvent extends AuthEvent {}

class RequestNewPasswordEvent extends AuthEvent {
  final String email;

  RequestNewPasswordEvent({@required this.email});
}
