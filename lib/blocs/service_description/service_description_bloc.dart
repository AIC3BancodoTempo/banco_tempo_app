import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../core/models/service_model.dart';
import '../../core/models/exchange_model.dart';
import '../../resources/exchange/firestore_exchange.dart';

part 'service_description_event.dart';
part 'service_description_state.dart';

class ServiceDescriptionBloc
    extends Bloc<ServiceDescriptionEvent, ServiceDescriptionState> {
  final ServiceModel serviceModel;
  final User user;
  ServiceDescriptionBloc({@required this.user, @required this.serviceModel})
      : super(ServiceDescriptionInitial());
  final ExchangeRepository _exchangeRepository = ExchangeRepository();
  List<DropdownMenuItem<String>> quantidadeList = [];
  ExchangeModel exchange;
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

  int getAmount() {
    return amount;
  }

  List<DropdownMenuItem<String>> getDrop() {
    return quantidadeList;
  }

  @override
  Stream<ServiceDescriptionState> mapEventToState(
    ServiceDescriptionEvent event,
  ) async* {
    try {
      if (event is StartedEvent) {
        yield LoadingScreenState();
        if (serviceModel.userPostId == user.uid || serviceModel.isSearch) {
          exchange = await _exchangeRepository.getFirstExchange(
              serviceModel.productId, user.uid);
        } else {
          exchange = await _exchangeRepository.getExchangeById(
              serviceModel.productId, user.uid);
        }
        if (exchange != null) {
          amount = exchange.amount;
        }
        buildDrop(serviceModel.productQuantity);
        yield ShowScreenState();
      } else if (event is ChatPressedEvent) {
        yield LoadingScreenState();
        if (exchange != null) {
          if (amount != exchange.amount) {
            await _exchangeRepository.updateAmount(exchange.key, amount);
            exchange.amount = amount;
          }
          yield ChatPressedState(exchangeModel: exchange);
          yield ShowScreenState();
        } else if (amount > 0) {
          var uid = Uuid();
          exchange = ExchangeModel(
              key: uid.v1(),
              userConsumerId:
                  serviceModel.isSearch ? serviceModel.userPostId : user.uid,
              userConsumerName: serviceModel.isSearch
                  ? serviceModel.userPostName
                  : user.displayName,
              productId: serviceModel.productId,
              productName: serviceModel.productName,
              salaId: uid.v1(),
              status: 0,
              amount: amount,
              cost: serviceModel.custoHoras,
              userPostId:
                  serviceModel.isSearch ? user.uid : serviceModel.userPostId,
              userPostName: serviceModel.isSearch
                  ? user.displayName
                  : serviceModel.userPostName);
          exchange.key = await _exchangeRepository.insertExchange(exchange);
          yield ChatPressedState(exchangeModel: exchange);
          yield ShowScreenState();
        } else {
          yield WarningState(message: "Necessário selecionar a quantidade!");
          yield ShowScreenState();
        }
      }
    } catch (e) {
      print(e.toString());
      yield WarningState(message: "Algo saiu errado!");
    }
  }
}
