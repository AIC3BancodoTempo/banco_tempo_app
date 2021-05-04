import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../core/models/service_model.dart';
import '../../resources/service/firestore_service.dart';
import '../../resources/storage/firebase_storage.dart';

part 'pending_post_event.dart';
part 'pending_post_state.dart';

class PendingPostBloc extends Bloc<PendingPostEvent, PendingPostState> {
  final ServiceRepository _serviceRepository = ServiceRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final ServiceModel productModel;

  List<ServiceModel> serviceList = [];
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
        serviceList = await _serviceRepository.getLastService(0);
        Stream<QuerySnapshot> stream =
            _serviceRepository.getStreamLastService(0);
        _subscription = stream.listen((event) {
          if (event.docs.length > 0) {
            Map<String, dynamic> data = event.docs.first.data();
            ServiceModel prod =
                ServiceModel.fromSnapshot(data, event.docs.first);
            int index = serviceList
                .indexWhere((element) => prod.productId == element.productId);
            if (index >= 0)
              serviceList[index] = prod;
            else
              serviceList.insert(0, prod);
            add(NewPendingPostEvent());
          }
        });
        yield ShowPendingPostState();
      } else if (event is GetMorePendingPostsEvent) {
        if (!noMore) {
          List<ServiceModel> modelList = await _serviceRepository
              .getMoreService(0, serviceList.last.documentSnapshot);
          serviceList += modelList;
          if (modelList.length <= 0) noMore = true;
          add(NewPendingPostEvent());
        }
      } else if (event is NewPendingPostEvent) {
        yield UpdatePendingPostState();
        yield ShowPendingPostState();
      } else if (event is AcceptPendingPostEvent) {
        bool success = await _serviceRepository.updateStatus(event.docId, 1);
        if (success) {
          int index = serviceList
              .indexWhere((element) => event.docId == element.productId);
          if (index >= 0) serviceList.removeAt(index);
        }
        add(NewPendingPostEvent());
      } else if (event is RejectPendingPostEvent) {
        bool success = await _serviceRepository.delete(event.docId);
        if (success) {
          int index = serviceList
              .indexWhere((element) => event.docId == element.productId);
          if (index >= 0) {
            for (var item in serviceList[index].images) {
              await _storageRepository.removeFile(item);
            }
            serviceList.removeAt(index);
          }
        }
        add(NewPendingPostEvent());
      }
    } catch (e) {
      yield ShowPendingPostState();
    }
  }
}
