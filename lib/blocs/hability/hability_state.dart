part of 'hability_bloc.dart';

abstract class HabilityState extends Equatable {
  const HabilityState();

  @override
  List<Object> get props => [];
}

class HabilityInitial extends HabilityState {}

class LoadingHabilityState extends HabilityState {}

class ShowHabilityState extends HabilityState {}
