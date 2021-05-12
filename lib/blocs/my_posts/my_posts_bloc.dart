import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/service_model.dart';
import '../../resources/service/firestore_service.dart';

part 'my_posts_event.dart';
part 'my_posts_state.dart';

class MyPostsBloc extends Bloc<MyPostsEvent, MyPostsState> {
  final ServiceRepository _serviceRepository = ServiceRepository();
  final User user;
  final ServiceModel productModel;
  List<ServiceModel> postsList = [];
  bool noMore;
  StreamSubscription _subscription;
  MyPostsBloc({this.user, this.productModel}) : super(MyPostsInitial());
  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  List<ServiceModel> getProductList() {
    return postsList;
  }

  getProductLength() {
    return postsList.length;
  }

  @override
  Stream<MyPostsState> mapEventToState(
    MyPostsEvent event,
  ) async* {
    try {
      if (event is MyPostsStartedEvent) {
        yield LoadingMyPostsState();
        postsList = await _serviceRepository.getAbilityByUser(user.uid);
        yield ShowMyPostsState();
      } else if (event is RemoveMyPostsEvent) {
        yield MyPostsYetState();
        postsList.removeAt(event.index);
        await _serviceRepository.removeAbility(event.key);
        yield ChangeProductState();
      } else if (event is GetMorePostsEvent) {
        if (!noMore) {
          List<ServiceModel> modelList = await _serviceRepository
              .getMoreMyPosts(user.uid, postsList.last.documentSnapshot);
          postsList += modelList;
          if (modelList.length <= 0) noMore = true;
          add(NewMyPostsEvent());
        }
      } else if (event is NewMyPostsEvent) {
        yield UpdateMyPostsState();
        yield ShowMyPostsState();
      }
    } catch (e) {
      print(e.toString());
      yield ShowMyPostsState();
    }
  }
}
