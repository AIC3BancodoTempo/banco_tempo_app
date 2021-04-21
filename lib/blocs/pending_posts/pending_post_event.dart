part of 'pending_post_bloc.dart';

abstract class PendingPostEvent extends Equatable {
  const PendingPostEvent();

  @override
  List<Object> get props => [];
}

class PendingPostStartedEvent extends PendingPostEvent {}

class ReceivedEvent extends PendingPostEvent {
  final String productName;
  final double custoHoras;
  final int productQuantity;
  final List<String> images;

  ReceivedEvent(
      {this.productName, this.custoHoras, this.productQuantity, this.images});
  @override
  List<Object> get props => [productName, custoHoras, productQuantity, images];
}

class GetMorePendingPostsEvent extends PendingPostEvent {}

class NewPendingPostEvent extends PendingPostEvent {}
