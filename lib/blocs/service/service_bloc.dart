import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../core/models/service_model.dart';
import '../../resources/service/firestore_service.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository _serviceRepository = ServiceRepository();
  final ServiceModel productModel;

  List<ServiceModel> serviceList = [];
  bool noMore;
  StreamSubscription _subscription;
  ServiceBloc({this.productModel}) : super(ServiceInitial());
  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  List<ServiceModel> _filteredProducs(value) {
    return serviceList
        .where((prod) =>
            prod.productName.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @override
  Stream<ServiceState> mapEventToState(
    ServiceEvent event,
  ) async* {
    try {
      if (event is ServiceStartedEvent) {
        yield LoadingServiceState();
        serviceList = await _serviceRepository.getLastService(1);
        Stream<QuerySnapshot> stream =
            _serviceRepository.getStreamLastService(1);
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
            add(NewServiceEvent());
          }
        });
        yield ShowServiceState(serviceList: serviceList);
      } else if (event is GetMoreProductsEvent) {
        if (!noMore) {
          List<ServiceModel> modelList = await _serviceRepository
              .getMoreService(1, serviceList.last.documentSnapshot);
          serviceList += modelList;
          if (modelList.length <= 0) noMore = true;
          add(NewServiceEvent());
        }
      } else if (event is NewServiceEvent) {
        yield LoadingServiceState();
        yield ShowServiceState(serviceList: serviceList);
      } else if (event is SearchServiceEvent) {
        yield LoadingServiceState();
        if (event.search.isNotEmpty) {
          List<ServiceModel> filterList = _filteredProducs(event.search);
          yield ShowServiceState(serviceList: filterList);
        } else {
          yield ShowServiceState(serviceList: serviceList);
        }
      }
    } catch (e) {
      print(e.toString());
      yield ShowServiceState(serviceList: serviceList);
    }
  }
}
