import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../core/models/produto_model.dart';
import '../../resources/hability/firestore_hability.dart';
import '../../resources/storage/firebase_storage.dart';

part 'pending_post_event.dart';
part 'pending_post_state.dart';

class PendingPostBloc extends Bloc<PendingPostEvent, PendingPostState> {
  final HabilityRepository _habilityRepository = HabilityRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final ProdutoModel productModel;

  List<ProdutoModel> habilityList = [];
  bool noMore;
  StreamSubscription _subscription;
  PendingPostBloc({this.productModel}) : super(PendingPostInitial());
  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  @override
  Stream<PendingPostState> mapEventToState(
    PendingPostEvent event,
  ) async* {
    try {
      if (event is PendingPostStartedEvent) {
        yield LoadingPendingPostState();
        habilityList = await _habilityRepository.getLastHability(0);
        Stream<QuerySnapshot> stream =
            _habilityRepository.getStreamLastHability(0);
        _subscription = stream.listen((event) {
          if (event.docs.length > 0) {
            Map<String, dynamic> data = event.docs.first.data();
            ProdutoModel prod =
                ProdutoModel.fromSnapshot(data, event.docs.first);
            int index = habilityList
                .indexWhere((element) => prod.productId == element.productId);
            if (index >= 0)
              habilityList[index] = prod;
            else
              habilityList.insert(0, prod);
            add(NewPendingPostEvent());
          }
        });
        yield ShowPendingPostState();
      } else if (event is GetMorePendingPostsEvent) {
        if (!noMore) {
          List<ProdutoModel> modelList = await _habilityRepository
              .getMoreHability(0, habilityList.last.documentSnapshot);
          habilityList += modelList;
          if (modelList.length <= 0) noMore = true;
          add(NewPendingPostEvent());
        }
      } else if (event is NewPendingPostEvent) {
        yield UpdatePendingPostState();
        yield ShowPendingPostState();
      } else if (event is AcceptPendingPostEvent) {
        bool success = await _habilityRepository.updateStatus(event.docId, 1);
        if (success) {
          int index = habilityList
              .indexWhere((element) => event.docId == element.productId);
          if (index >= 0) habilityList.removeAt(index);
        }
        add(NewPendingPostEvent());
      } else if (event is RejectPendingPostEvent) {
        bool success = await _habilityRepository.delete(event.docId);
        if (success) {
          int index = habilityList
              .indexWhere((element) => event.docId == element.productId);
          if (index >= 0) {
            for (var item in habilityList[index].images) {
              await _storageRepository.removeFile(item);
            }
            habilityList.removeAt(index);
          }
        }
        add(NewPendingPostEvent());
      }
    } catch (e) {
      yield ShowPendingPostState();
    }
  }
}
