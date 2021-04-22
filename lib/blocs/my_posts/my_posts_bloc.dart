import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../core/models/produto_model.dart';
import '../../resources/hability/firestore_hability.dart';

part 'my_posts_event.dart';
part 'my_posts_state.dart';

class MyPostsBloc extends Bloc<MyPostsEvent, MyPostsState> {
  final HabilityRepository _habilityRepository = HabilityRepository();
  final ProdutoModel productModel;
  List<ProdutoModel> postsList = [];
  bool noMore;
  StreamSubscription _subscription;
  MyPostsBloc({this.productModel}) : super(MyPostsInitial());
  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  @override
  Stream<MyPostsState> mapEventToState(
    MyPostsEvent event,
  ) async* {
    try {
      if (event is MyPostsStartedEvent) {
        yield LoadingMyPostsState();
        postsList = await _habilityRepository.getLastHability(1);
        Stream<QuerySnapshot> stream =
            _habilityRepository.getStreamLastHability(1);
        _subscription = stream.listen((event) {
          if (event.docs.length > 0) {
            Map<String, dynamic> data = event.docs.first.data();
            ProdutoModel prod =
                ProdutoModel.fromSnapshot(data, event.docs.first);
            int index = postsList
                .indexWhere((element) => prod.productId == element.productId);
            if (index >= 0)
              postsList[index] = prod;
            else
              postsList.insert(0, prod);
            add(NewMyPostsEvent());
          }
        });
        yield ShowMyPostsState();
      } else if (event is GetMorePostsEvent) {
        if (!noMore) {
          List<ProdutoModel> modelList = await _habilityRepository
              .getMoreHability(1, postsList.last.documentSnapshot);
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
