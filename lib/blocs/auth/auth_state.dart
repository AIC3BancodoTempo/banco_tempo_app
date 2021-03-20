part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final User user;
  AuthenticatedState({this.user});
}

class UnauthenticatedState extends AuthState {}

class ExceptionState extends AuthState {
  final String message;

  ExceptionState({this.message});
}

class LoadingState extends AuthState {}

class SignupState extends AuthState {}

class ForgotState extends AuthState {}

class LoginState extends AuthState {}
