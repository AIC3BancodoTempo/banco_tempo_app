part of 'exchange_in_progress_bloc.dart';

abstract class ExchangeInProgressEvent extends Equatable {
  const ExchangeInProgressEvent();

  @override
  List<Object> get props => [];
}

class ExchangeInProgressStartedEvent extends ExchangeInProgressEvent {}

class GetMoreConsumerExchangesEvent extends ExchangeInProgressEvent {}

class GetMorePostExchangesEvent extends ExchangeInProgressEvent {}
