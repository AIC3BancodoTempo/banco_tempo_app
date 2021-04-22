part of 'my_posts_bloc.dart';

abstract class MyPostsEvent extends Equatable {
  const MyPostsEvent();

  @override
  List<Object> get props => [];
}

class MyPostsStartedEvent extends MyPostsEvent {}

class ReceivedEvent extends MyPostsEvent {
  final String productName;
  final double custoHoras;
  final int productQuantity;
  final List<String> images;

  ReceivedEvent(
      {this.productName, this.custoHoras, this.productQuantity, this.images});
  @override
  List<Object> get props => [productName, custoHoras, productQuantity, images];
}

class GetMorePostsEvent extends MyPostsEvent {}

class NewMyPostsEvent extends MyPostsEvent {}
