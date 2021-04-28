import 'dart:async';

import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/resources/user/firebase_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../core/errors/auth_error.dart';
import '../../resources/auth/auth_firestore.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UsersRepository usersRepository = UsersRepository();
  final AuthRepository authRepository = AuthRepository();
  final User user;

  String _email, _nome;
  UserModel userInfo;

  ProfileBloc(this.user) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ScreenStarded) {
      yield LoadingState();
      userInfo = await usersRepository.getUserById(user.uid);
      _email = userInfo.email;
      _nome = userInfo.nome;
      yield ProfileLoadedState();
    } else if (event is SendPasswordRecover) {
      try {
        await authRepository.requestNewPassword(user.email);
        yield SuccessState(message: 'E-mail de alteração de senha enviado');
      } catch (e) {
        yield FailState(message: authErrorHandler(e));
      }
    }
  }
}
