import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/troca_model.dart';

class TrocaRepository {
  FirebaseFirestore firestoreInstance;

  TrocaRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<String> insertTroca(TrocaModel model) async {
    return await firestoreInstance
        .collection('troca')
        .add(model.toMap())
        .then((value) {
      return value.id;
    }).catchError((error) => throw Exception(error));
  }

  Future<bool> concluiTroca(String docId) async {
    return await firestoreInstance
        .collection('troca')
        .doc(docId)
        .update({'status': 1}).then((value) {
      return true;
    }).catchError((error) => throw Exception(error));
  }

  Future<TrocaModel> getTrocaById(String productId, String consumerId) async {
    TrocaModel model;
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("productId", isEqualTo: productId)
          .where('userConsumerId', isEqualTo: consumerId)
          .limit(1)
          .get();
      if (snapshot.docs.length > 0) {
        model = TrocaModel.fromSnapshot(snapshot.docs.first);
      }
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  Future<TrocaModel> getFirstTroca(String productId, String userPostId) async {
    TrocaModel model;
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("productId", isEqualTo: productId)
          .where('userPostId', isEqualTo: userPostId)
          .limit(1)
          .get();
      if (snapshot.docs.length > 0) {
        model = TrocaModel.fromSnapshot(snapshot.docs.first);
      }
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }
}
