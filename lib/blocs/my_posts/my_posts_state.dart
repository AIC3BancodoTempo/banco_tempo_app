part of 'my_posts_bloc.dart';

abstract class MyPostsState extends Equatable {
  const MyPostsState();

  @override
  List<Object> get props => [];
}

class MyPostsInitial extends MyPostsState {}

class LoadingMyPostsState extends MyPostsState {}

class ShowMyPostsState extends MyPostsState {}

class UpdateMyPostsState extends MyPostsState {}

class MyPostsYetState extends MyPostsState {}

class ChangeProductState extends MyPostsState {}
