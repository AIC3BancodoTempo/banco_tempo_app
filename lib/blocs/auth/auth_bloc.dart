import 'dart:async';

import 'package:banco_do_tempo_app/core/errors/auth_error.dart';
import 'package:banco_do_tempo_app/resources/messaging/firebase_messaging.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../core/models/user_model.dart';
import '../../resources/caixa/firestore_caixa.dart';
import '../../resources/auth/auth_firestore.dart';
import '../../resources/user/firebase_user.dart';
import '../../resources/tokens/firestore_tokens.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();
  final UsersRepository _usersRepository = UsersRepository();
  final MessagingRepository _messagingRepository = MessagingRepository();
  TokenRepository tokenRepository = TokenRepository();
  final CaixaRepository _caixaRepository = CaixaRepository();
  AuthBloc() : super(AuthInitial());
  User user;
  UserModel userModel;
  StreamSubscription _subscription;
  _checkToken() {
    _messagingRepository.tokenState(user.uid).then((value) {
      if (!value) {
        _messagingRepository.setToken(user.uid, true);
      }
    });
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is AppStartedEvent) {
        yield LoadingState();

        user = await _authRepository.getUser();
        if (user != null) {
          add(LoginSuccessEvent(user: user));
        } else {
          add(ToWelcomeEvent());
        }
      } else if (event is LoginEmailEvent) {
        user = await _authRepository.signInEmailAndPassword(
            event.email, event.senha);
        userModel = await _usersRepository.getUserById(user.uid);
        if (userModel == null) {
          yield UnauthenticatedState();
        } else {
          yield AuthenticatedState(user: user, userModel: userModel);
        }
      } else if (event is LogoutEvent) {
        await _authRepository.signOut();
        yield UnauthenticatedState();
      } else if (event is ExitEvent) {
        yield UnauthenticatedState();
      } else if (event is SignupEvent) {
        yield SignupState();
      } else if (event is LoginEvent) {
        yield LoginState();
      } else if (event is LoginSuccessEvent) {
        user = event.user;
        userModel = await _usersRepository.getUserById(user.uid);
        if (userModel == null) {
          yield UnauthenticatedState();
        } else {
          _checkToken();
          yield AuthenticatedState(user: user, userModel: userModel);
        }
      } else if (event is ForgotEvent) {
        yield ForgotState();
      } else if (event is RequestNewPasswordEvent) {
        bool success = await _authRepository.requestNewPassword(event.email);
        if (success) {
          yield UnauthenticatedState();
          yield ExceptionState(
              message: "Um e-mail foi enviado para a recuperação da senha");
        }
      } else if (event is CreateLoginEmailEvent) {
        user = await _authRepository.createUserWithEmailPass(
            event.email, event.senha);
        await user.updatePhotoURL(event.nome);
        userModel = await _usersRepository.insertUser(
          user.uid,
          event.email,
          event.nome,
        );
        user.updateDisplayName(event.nome);
        String token = await _messagingRepository.getToken();
        // ignore: unused_local_variable
        bool insertedToken = await tokenRepository.setToken(user.uid, token);

        if (userModel == null) {
          yield UnauthenticatedState();
        } else {
          await _caixaRepository.addCaixa();
          yield AuthenticatedState(user: user, userModel: userModel);
        }
      } else if (event is QuestionaryEvent) {
        yield QuestionaryState();
      } else if (event is ToWelcomeEvent) {
        yield WelcomeState();
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
