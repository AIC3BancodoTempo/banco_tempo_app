import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/exchange_model.dart';
import '../../resources/exchange/firestore_exchange.dart';

part 'exchange_in_progress_event.dart';
part 'exchange_in_progress_state.dart';

class ExchangeInProgressBloc
    extends Bloc<ExchangeInProgressEvent, ExchangeInProgressState> {
  final ExchangeRepository _exchangeRepository = ExchangeRepository();

  final User user;
  ExchangeInProgressBloc({this.user}) : super(ExchangeInProgressInitial());
  List<ExchangeModel> exchangesConsumerList = [];
  List<ExchangeModel> exchangesPostList = [];
  bool noMoreConsumer = false;
  bool noMorePost = false;

  @override
  Future<void> close() {
    for (var i = 0; i < exchangesConsumerList.length; i++) {
      exchangesConsumerList[i].close();
    }
    for (var i = 0; i < exchangesPostList.length; i++) {
      exchangesPostList[i].close();
    }
    return super.close();
  }

  @override
  Stream<ExchangeInProgressState> mapEventToState(
    ExchangeInProgressEvent event,
  ) async* {
    try {
      if (event is ExchangeInProgressStartedEvent) {
        yield LoadingExchangesState();
        exchangesConsumerList =
            await _exchangeRepository.getExchangesConsumerUser(user.uid);
        exchangesPostList =
            await _exchangeRepository.getExchangesPostUser(user.uid);
        yield ShowItensState();
      } else if (event is GetMorePostExchangesEvent) {
        int len = exchangesPostList.length;
        if (!noMorePost) {
          exchangesPostList += await _exchangeRepository
              .getMoreExchangesPostUser(user.uid, exchangesPostList.last.doc);
          if (len == exchangesPostList.length) noMorePost = true;
          yield UpdateItensState();
          yield ShowItensState();
        }
      } else if (event is GetMoreConsumerExchangesEvent) {
        int len = exchangesConsumerList.length;
        if (!noMoreConsumer) {
          exchangesConsumerList +=
              await _exchangeRepository.getMoreExchangesConsumerUser(
                  user.uid, exchangesConsumerList.last.doc);
          if (len == exchangesConsumerList.length) noMoreConsumer = true;
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
