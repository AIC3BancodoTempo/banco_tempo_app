part of 'pending_post_bloc.dart';

abstract class PendingPostState extends Equatable {
  const PendingPostState();

  @override
  List<Object> get props => [];
}

class PendingPostInitial extends PendingPostState {}

class ShowPendingPostState extends PendingPostState {}

class LoadingPendingPostState extends PendingPostState {}

class UpdatePendingPostState extends PendingPostState {}
