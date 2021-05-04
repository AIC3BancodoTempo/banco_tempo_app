part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class ServiceStartedEvent extends ServiceEvent {}

class ReceivedEvent extends ServiceEvent {
  final String productName;
  final double custoHoras;
  final int productQuantity;
  final List<String> images;

  ReceivedEvent(
      {this.productName, this.custoHoras, this.productQuantity, this.images});
  @override
  List<Object> get props => [productName, custoHoras, productQuantity, images];
}

class GetMoreProductsEvent extends ServiceEvent {}

class NewServiceEvent extends ServiceEvent {}

class SearchServiceEvent extends ServiceEvent {
  final String search;

  SearchServiceEvent({this.search});
}
