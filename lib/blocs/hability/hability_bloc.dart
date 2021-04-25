import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../core/models/produto_model.dart';
import '../../resources/hability/firestore_hability.dart';

part 'hability_event.dart';
part 'hability_state.dart';

class HabilityBloc extends Bloc<HabilityEvent, HabilityState> {
  final HabilityRepository _habilityRepository = HabilityRepository();
  final ProdutoModel productModel;

  List<ProdutoModel> habilityList = [];
  bool noMore;
  StreamSubscription _subscription;
  HabilityBloc({this.productModel}) : super(HabilityInitial());
  @override
  Future<void> close() {
    if (_subscription != null) _subscription.cancel();
    return super.close();
  }

  List<ProdutoModel> _filteredProducs(value) {
    return habilityList
          .where((prod) =>
              prod.productName.toLowerCase().contains(value.toLowerCase()))
          .toList();
  }

  @override
  Stream<HabilityState> mapEventToState(
    HabilityEvent event,
  ) async* {
    try {
      if (event is HabilityStartedEvent) {
        yield LoadingHabilityState();
        habilityList = await _habilityRepository.getLastHability(1);
        Stream<QuerySnapshot> stream =
            _habilityRepository.getStreamLastHability(1);
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
            add(NewHabilityEvent());
          }
        });
        yield ShowHabilityState(habilityList: habilityList);
      } else if (event is GetMoreProductsEvent) {
        if (!noMore) {
          List<ProdutoModel> modelList = await _habilityRepository
              .getMoreHability(1, habilityList.last.documentSnapshot);
          habilityList += modelList;
          if (modelList.length <= 0) noMore = true;
          add(NewHabilityEvent());
        }
      } else if (event is NewHabilityEvent) {
        yield LoadingHabilityState();
        yield ShowHabilityState(habilityList: habilityList);
        
      }
      else if(event is SearchHabilityEvent){
        
        yield LoadingHabilityState();
        if(event.search.isNotEmpty){
          List<ProdutoModel> filterList = _filteredProducs(event.search);
          yield ShowHabilityState(habilityList: filterList);
        } else {
          yield ShowHabilityState(habilityList: habilityList);
        }

      }
    } catch (e) {
      print(e.toString());
      yield ShowHabilityState(habilityList: habilityList);
    }
  }
}
