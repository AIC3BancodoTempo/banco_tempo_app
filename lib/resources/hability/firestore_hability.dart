import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/produto_model.dart';

class HabilityRepository {
  FirebaseFirestore firestoreInstance;

  HabilityRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<List<ProdutoModel>> getLastHability(int status) async {
    List<ProdutoModel> productList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('produto')
        .where('status', isEqualTo: status)
        .orderBy('data', descending: true)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        productList.add(ProdutoModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Future<List<ProdutoModel>> getAbilityByUser(
    String userId,
  ) async {
    List<ProdutoModel> productList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('produto')
        .where('status', whereIn: [0, 1])
        .where('userPostId', isEqualTo: userId)
        .orderBy('data', descending: true)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        productList.add(ProdutoModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Stream<QuerySnapshot> getStreamLastHability(int status) {
    return firestoreInstance
        .collection('produto')
        .where('status', isEqualTo: status)
        .orderBy('data', descending: true)
        .limit(1)
        .snapshots();
  }

  Future<List<ProdutoModel>> getMoreHability(
      int status, DocumentSnapshot docRef) async {
    List<ProdutoModel> productList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('produto')
        .where('status', isEqualTo: status)
        .orderBy('data', descending: true)
        .startAfterDocument(docRef)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        productList.add(ProdutoModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Future<List<ProdutoModel>> getMoreMyPosts(
      String userId, DocumentSnapshot docRef) async {
    List<ProdutoModel> productList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('produto')
        .where('status', whereIn: [0, 1])
        .where('userPostId', isEqualTo: userId)
        .orderBy('data', descending: true)
        .startAfterDocument(docRef)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        productList.add(ProdutoModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Future<ProdutoModel> getHabilityById(String docId) async {
    ProdutoModel product;
    DocumentSnapshot snapshot =
        await firestoreInstance.collection('produto').doc(docId).get();
    if (snapshot != null) {
      Map<String, dynamic> data = snapshot.data();
      product = ProdutoModel.fromSnapshot(data, snapshot);
    }
    return product;
  }

  Future<void> removeAbility(String docId) async {
    await firestoreInstance.collection('produto').doc(docId).delete();
  }

  Future<bool> updateStatus(String docId, int status) async {
    return await firestoreInstance.collection('produto').doc(docId).update({
      'status': status,
      'data': DateTime.now().millisecondsSinceEpoch
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<bool> delete(String docId) async {
    return await firestoreInstance
        .collection('produto')
        .doc(docId)
        .delete()
        .then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<bool> decrementaQuantidade(String userId, int qtd) async {
    return await firestoreInstance.collection('produto').doc(userId).set({
      'productQuantity': FieldValue.increment(-qtd),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }
}
