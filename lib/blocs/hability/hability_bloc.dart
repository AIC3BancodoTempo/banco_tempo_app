import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/models/produto_model.dart';
import '../../resources/hability/firestore_hability.dart';

part 'hability_event.dart';
part 'hability_state.dart';

class HabilityBloc extends Bloc<HabilityEvent, HabilityState> {
  final HabilityRepository _habilityRepository = HabilityRepository();
  final ProdutoModel productModel;

  List<ProdutoModel> habilityList = [];
  HabilityBloc({this.productModel}) : super(HabilityInitial());

  @override
  Stream<HabilityState> mapEventToState(
    HabilityEvent event,
  ) async* {
    if (event is HabilityStartedEvent) {
      yield LoadingHabilityState();
      if (productModel.productId.isEmpty) {
        habilityList = await _habilityRepository.getLastHability(1);
      }
      yield ShowHabilityState();
    }
  }
}
