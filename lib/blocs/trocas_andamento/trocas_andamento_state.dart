part of 'trocas_andamento_bloc.dart';

abstract class TrocasAndamentoState extends Equatable {
  const TrocasAndamentoState();

  @override
  List<Object> get props => [];
}

class TrocasAndamentoInitial extends TrocasAndamentoState {}

class LoadingTrocasState extends TrocasAndamentoState {}

class ShowItensState extends TrocasAndamentoState {}

class UpdateItensState extends TrocasAndamentoState {}
