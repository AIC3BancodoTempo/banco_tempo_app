part of 'hability_bloc.dart';

abstract class HabilityState extends Equatable {
  const HabilityState();

  @override
  List<Object> get props => [];
}

class HabilityInitial extends HabilityState {}

class LoadingState extends HabilityState {
  @override
  List<Object> get props => [];
}

class ShowHabilityState extends HabilityState {}

class updateHabilityState extends HabilityState {}
