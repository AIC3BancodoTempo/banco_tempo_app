import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/produto_model.dart';
import '../../resources/hability/firestore_hability.dart';

part 'my_posts_event.dart';
part 'my_posts_state.dart';

class MyPostsBloc extends Bloc<MyPostsEvent, MyPostsState> {
  final HabilityRepository _habilityRepository = HabilityRepository();
  final User user;
  final ProdutoModel productModel;
  List<ProdutoModel> postsList = [];
  bool noMore;
  StreamSubscription _subscription;
  MyPostsBloc({this.user, this.productModel}) : super(MyPostsInitial());
  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  List<ProdutoModel> getProductList() {
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
        postsList = await _habilityRepository.getAbilityByUser(user.uid);
        yield ShowMyPostsState();
      } else if (event is RemoveMyPostsEvent) {
        yield MyPostsYetState();
        postsList.removeAt(event.index);
        await _habilityRepository.removeAbility(event.key);
        yield ChangeProductState();
      } else if (event is GetMorePostsEvent) {
        if (!noMore) {
          List<ProdutoModel> modelList = await _habilityRepository
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
