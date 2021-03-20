import 'dart:async';

import '../../core/errors/auth_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../resources/auth/auth_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(AuthInitial());
  User user;
  StreamSubscription _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is AppStartedEvent) {
        yield LoadingState();

        Stream<User> stream = await authRepository.getUser();
        _subscription = stream.listen((event) {
          user = event;
          if (user != null) {
            add(LoginSuccessEvent(user: user));
          } else {
            add(ExitEvent());
          }
        });
      } else if (event is LoginEmailEvent) {
        user = await authRepository.signInEmailAndPassword(
            event.email, event.senha);
        yield AuthenticatedState(user: user);
      } else if (event is LogoutEvent) {
        await authRepository.signOut();
        yield UnauthenticatedState();
      } else if (event is ExitEvent) {
        yield UnauthenticatedState();
      } else if (event is SignupEvent) {
        yield SignupState();
      } else if (event is LoginEvent) {
        yield LoginState();
      } else if (event is LoginSuccessEvent) {
        yield AuthenticatedState(user: event.user);
      } else if (event is ForgotEvent) {
        yield ForgotState();
        yield UnauthenticatedState();
      } else if (event is CreateLoginEmailEvent) {
        user = await authRepository.createUserWithEmailPass(
            event.email, event.senha);
        yield AuthenticatedState(user: user);
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        yield ExceptionState(message: authErrorHandler(e));
        yield UnauthenticatedState();
      } else {
        yield ExceptionState(message: e.toString());
        yield UnauthenticatedState();
      }
    }
  }
}
