import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/exchange_model.dart';

class ExchangeRepository {
  FirebaseFirestore firestoreInstance;

  ExchangeRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<String> insertExchange(ExchangeModel model) async {
    return await firestoreInstance
        .collection('troca')
        .add(model.toMap())
        .then((value) {
      return value.id;
    }).catchError((error) => throw Exception(error));
  }

  Future<bool> concluiExchange(String docId) async {
    return await firestoreInstance
        .collection('troca')
        .doc(docId)
        .update({'status': 1}).then((value) {
      return true;
    }).catchError((error) => throw Exception(error));
  }

  Future<ExchangeModel> getExchangeById(
      String productId, String consumerId) async {
    ExchangeModel model;
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("productId", isEqualTo: productId)
          .where('userConsumerId', isEqualTo: consumerId)
          .limit(1)
          .get();
      if (snapshot.docs.length > 0) {
        model = ExchangeModel.fromSnapshot(snapshot.docs.first);
      }
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  Future<ExchangeModel> getFirstExchange(
      String productId, String userPostId) async {
    ExchangeModel model;
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("productId", isEqualTo: productId)
          .where('userPostId', isEqualTo: userPostId)
          .limit(1)
          .get();
      if (snapshot.docs.length > 0) {
        model = ExchangeModel.fromSnapshot(snapshot.docs.first);
      }
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  Future<List<ExchangeModel>> getExchangesPostUser(String userId) async {
    List<ExchangeModel> modelList = [];
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("userPostId", isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .limit(10)
          .get();
      if (snapshot.size > 0) {
        snapshot.docs.forEach((element) async {
          ExchangeModel model = ExchangeModel.fromSnapshot(element);
          await model.subscribe();
          modelList.add(model);
        });
      }
    } catch (error) {
      throw error;
    }
    return modelList;
  }

  Future<List<ExchangeModel>> getMoreExchangesPostUser(
      String userId, DocumentSnapshot docRef) async {
    List<ExchangeModel> modelList = [];
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("userPostId", isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .startAfterDocument(docRef)
          .limit(10)
          .get();
      if (snapshot.size > 0) {
        snapshot.docs.forEach((element) async {
          ExchangeModel model = ExchangeModel.fromSnapshot(element);
          await model.subscribe();
          modelList.add(model);
        });
      }
    } catch (error) {
      throw Exception(error);
    }
    return modelList;
  }

  Future<List<ExchangeModel>> getExchangesConsumerUser(String userId) async {
    List<ExchangeModel> modelList = [];
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("userConsumerId", isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .limit(10)
          .get();
      if (snapshot.size > 0) {
        snapshot.docs.forEach((element) async {
          ExchangeModel model = ExchangeModel.fromSnapshot(element);
          await model.subscribe();
          modelList.add(model);
        });
      }
    } catch (error) {
      throw Exception(error);
    }
    return modelList;
  }

  Future<List<ExchangeModel>> getMoreExchangesConsumerUser(
      String userId, DocumentSnapshot docRef) async {
    List<ExchangeModel> modelList = [];
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("userConsumerId", isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .startAfterDocument(docRef)
          .limit(10)
          .get();
      if (snapshot.size > 0) {
        snapshot.docs.forEach((element) async {
          ExchangeModel model = ExchangeModel.fromSnapshot(element);
          await model.subscribe();
          modelList.add(model);
        });
      }
    } catch (error) {
      throw Exception(error);
    }
    return modelList;
  }
}
