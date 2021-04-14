part of 'hability_bloc.dart';

abstract class HabilityEvent extends Equatable {
  const HabilityEvent();

  @override
  List<Object> get props => [];
}

class HabilityStartedEvent extends HabilityEvent {}

class ReceivedEvent extends HabilityEvent {
  final String productName;
  final double custoHoras;
  final int productQuantity;
  final List<String> images;

  ReceivedEvent(
      {this.productName, this.custoHoras, this.productQuantity, this.images});
  @override
  List<Object> get props => [productName, custoHoras, productQuantity, images];
}
