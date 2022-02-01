import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../core/models/service_model.dart';
import '../../core/models/user_model.dart';
import '../../resources/service/firestore_service.dart';
import '../../resources/storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
part 'add_service_event.dart';
part 'add_service_state.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  final ServiceRepository _abilityRepository = ServiceRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final UserModel user;
  ServiceModel product;
  AddServiceBloc({
    @required this.user,
  }) : super(AddServiceInitial());

  List<UploadJob> _pictures = [];

  void pictureCallback(
      {List<UploadJob> uploadJobs, bool pictureUploadProcessing}) {
    _pictures = uploadJobs;
  }

  List<UploadJob> getPictures() {
    return _pictures;
  }

  void setPictures() {
    for (var i = 0; i < product.images.length; i++) {
      Reference reference = _storageRepository.getReference(product.images[i]);
      UploadJob job = UploadJob(action: UploadAction.actionChange);
      job.id = int.tryParse(reference.name.split('')[0]);
      job.storageReference = reference;
      _pictures.add(job);
    }
  }

  Future<List<String>> getPicturesUrl() async {
    List<String> pic = [];
    for (var i = 0; i < _pictures.length; i++) {
      if (_pictures[i].storageReference != null) {
        String url = await _pictures[i].storageReference.getDownloadURL();
        if (url.isNotEmpty) {
          pic.add(url);
        }
      }
    }
    return pic;
  }

  setTypeProduct(String typeProduct) {
    product.typeProduct = typeProduct;
  }

  setTypeEvent(bool isEvent) {
    product.isEvent = isEvent;
  }

  setCreateEvent(String typeProduct) {
    if (typeProduct == 'Evento') {
      var id = '';
      var document = FirebaseFirestore.instance.collection('eventos');
      document.doc(id = Uuid().v4()).set({'users': []});
      product.idEvent = id;
    } else {
      product.idEvent = null;
    }
  }

  setCustoHoras(String custohoras) {
    product.custoHoras = double.parse(custohoras);
  }

  setDescription(String productDescription) {
    product.productDescription = productDescription;
  }

  setName(String productName) {
    product.productName = productName;
  }

  setQuantity(String productQuantity) {
    product.productQuantity = int.parse(productQuantity);
  }

  setTipe(bool isSearch) {
    product.isSearch = isSearch;
  }

  bool getLimitQuantityHours() {
    return (product.productQuantity * product.custoHoras + user.horas) <= 20;
  }

  @override
  Stream<AddServiceState> mapEventToState(
    AddServiceEvent event,
  ) async* {
    try {
      if (event is AddServiceStartedEvent) {
        product = ServiceModel(
            userPostId: user.key, userPostName: user.nome, status: 0);

        yield LoadedState();
      } else if (event is SubmitButtonPressed) {
        yield LoadingAddServiceState();
        List<String> pics = await getPicturesUrl();
        if (pics.length > 0) {
          product.images = pics;
        }
        bool result = false;
        if (product.isSearch) {
          product.productName = "Procuro: " + product.productName;
        }
        result = await _abilityRepository.insertProduct(product);

        if (result) {
          _pictures = [];
          yield LoadingAddServiceState();
          yield SuccessState();
        } else
          yield FailState(message: "Não foi possível realizar a operação");
      } else if (event is DisposeEvent) {
        if (_pictures.length > 0) {
          _pictures.forEach((element) {
            element.storageReference.delete();
          });
        }
      } else if (event is RestartEvent) {
        yield LoadedState();
      }
    } catch (e) {
      yield FailState(message: e.toString());
    }
  }
}
