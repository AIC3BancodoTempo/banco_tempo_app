part of 'exchange_in_progress_bloc.dart';

abstract class ExchangeInProgressState extends Equatable {
  const ExchangeInProgressState();

  @override
  List<Object> get props => [];
}

class ExchangeInProgressInitial extends ExchangeInProgressState {}

class LoadingExchangesState extends ExchangeInProgressState {}

class ShowItensState extends ExchangeInProgressState {}

class UpdateItensState extends ExchangeInProgressState {}
