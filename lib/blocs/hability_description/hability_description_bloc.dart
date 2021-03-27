import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../core/models/produto_model.dart';
import '../../core/models/troca_model.dart';
import '../../resources/troca/firestore_troca.dart';

part 'hability_description_event.dart';
part 'hability_description_state.dart';

class HabilityDescriptionBloc
    extends Bloc<HabilityDescriptionEvent, HabilityDescriptionState> {
  final ProdutoModel produtoModel;
  final User user;
  HabilityDescriptionBloc({@required this.user, @required this.produtoModel})
      : super(HabilityDescriptionInitial());
  final TrocaRepository _trocaRepository = TrocaRepository();
  List<DropdownMenuItem<String>> quantidadeList = [];
  TrocaModel troca;
  int amount = 0;

  void buildDrop(int amount) {
    for (var i = 1; i <= amount; i++) {
      quantidadeList.add(DropdownMenuItem<String>(
        child: Text(i.toString()),
        value: i.toString(),
      ));
    }
  }

  void setAmount(String value) {
    amount = int.parse(value);
  }

  List<DropdownMenuItem<String>> getDrop() {
    return quantidadeList;
  }

  @override
  Stream<HabilityDescriptionState> mapEventToState(
    HabilityDescriptionEvent event,
  ) async* {
    if (event is StartedEvent) {
      yield LoadingScreenState();
      troca =
          await _trocaRepository.getTrocaById(produtoModel.productId, user.uid);
      buildDrop(produtoModel.productQuantity);
      yield ShowScreenState();
    } else if (event is ChatPressedEvent) {
      yield LoadingScreenState();
      if (troca != null) {
        yield ChatPressedState(trocaModel: troca);
        yield ShowScreenState();
      } else if (amount > 0) {
        var uid = Uuid();
        troca = TrocaModel(
            userConsumerId: user.uid,
            userConsumerName: user.displayName,
            productId: produtoModel.productId,
            productName: produtoModel.productName,
            salaId: uid.v1(),
            status: 0,
            amount: amount,
            userPostId: produtoModel.userPostId,
            userPostName: produtoModel.userPostName);
        await _trocaRepository.insertTroca(troca);
        yield ChatPressedState(trocaModel: troca);
        yield ShowScreenState();
      } else {
        yield WarningState(message: "Necessário selecionar a quantidade");
        yield ShowScreenState();
      }
    }
  }
}
