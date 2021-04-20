import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/troca_model.dart';
import '../../resources/troca/firestore_troca.dart';

part 'trocas_andamento_event.dart';
part 'trocas_andamento_state.dart';

class TrocasAndamentoBloc
    extends Bloc<TrocasAndamentoEvent, TrocasAndamentoState> {
  final TrocaRepository _trocaRepository = TrocaRepository();

  final User user;
  TrocasAndamentoBloc({this.user}) : super(TrocasAndamentoInitial());
  List<TrocaModel> trocasConsumerList = [];
  List<TrocaModel> trocasPostList = [];
  bool noMoreConsumer = false;
  bool noMorePost = false;

  @override
  Stream<TrocasAndamentoState> mapEventToState(
    TrocasAndamentoEvent event,
  ) async* {
    try {
      if (event is TrocasAndamentoStartedEvent) {
        yield LoadingTrocasState();
        trocasConsumerList =
            await _trocaRepository.getTrocasConsumerUser(user.uid);
        trocasPostList = await _trocaRepository.getTrocasPostUser(user.uid);
        yield ShowItensState();
      } else if (event is GetMorePostTrocasEvent) {
        int len = trocasPostList.length;
        if (!noMorePost) {
          trocasPostList += await _trocaRepository.getMoreTrocasPostUser(
              user.uid, trocasPostList.last.doc);
          if (len == trocasPostList.length) noMorePost = true;
          yield UpdateItensState();
          yield ShowItensState();
        }
      } else if (event is GetMoreConsumerTrocasEvent) {
        int len = trocasConsumerList.length;
        if (!noMoreConsumer) {
          trocasConsumerList += await _trocaRepository
              .getMoreTrocasConsumerUser(user.uid, trocasConsumerList.last.doc);
          if (len == trocasConsumerList.length) noMoreConsumer = true;
          yield UpdateItensState();
          yield ShowItensState();
        }
      }
    } catch (e) {
      print(e.toString());
      yield ShowItensState();
    }
  }
}
