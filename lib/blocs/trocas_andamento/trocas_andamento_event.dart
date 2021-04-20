part of 'trocas_andamento_bloc.dart';

abstract class TrocasAndamentoEvent extends Equatable {
  const TrocasAndamentoEvent();

  @override
  List<Object> get props => [];
}

class TrocasAndamentoStartedEvent extends TrocasAndamentoEvent {}

class GetMoreConsumerTrocasEvent extends TrocasAndamentoEvent {}

class GetMorePostTrocasEvent extends TrocasAndamentoEvent {}
