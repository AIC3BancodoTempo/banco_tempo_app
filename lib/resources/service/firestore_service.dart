import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/service_model.dart';

class ServiceRepository {
  FirebaseFirestore firestoreInstance;

  ServiceRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<List<ServiceModel>> getLastService(int status) async {
    List<ServiceModel> productList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('produto')
        .where('status', isEqualTo: status)
        .orderBy('data', descending: true)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        productList.add(ServiceModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Future<List<ServiceModel>> getAbilityByUser(
    String userId,
  ) async {
    List<ServiceModel> productList = [];
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
        productList.add(ServiceModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Stream<QuerySnapshot> getStreamLastService(int status) {
    return firestoreInstance
        .collection('produto')
        .where('status', isEqualTo: status)
        .orderBy('data', descending: true)
        .limit(1)
        .snapshots();
  }

  Future<List<ServiceModel>> getMoreService(
      int status, DocumentSnapshot docRef) async {
    List<ServiceModel> productList = [];
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
        productList.add(ServiceModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Future<List<ServiceModel>> getMoreMyPosts(
      String userId, DocumentSnapshot docRef) async {
    List<ServiceModel> productList = [];
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
        productList.add(ServiceModel.fromSnapshot(data, element));
      });
    }
    return productList;
  }

  Future<ServiceModel> getServiceById(String docId) async {
    ServiceModel product;
    DocumentSnapshot snapshot =
        await firestoreInstance.collection('produto').doc(docId).get();
    if (snapshot != null) {
      Map<String, dynamic> data = snapshot.data();
      product = ServiceModel.fromSnapshot(data, snapshot);
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

  Future<bool> decrementaQuantidade(String docId, int qtd) async {
    return await firestoreInstance.collection('produto').doc(docId).set({
      'productQuantity': FieldValue.increment(-qtd),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<bool> insertProduct(
    ServiceModel serviceModel,
  ) async {
    return await firestoreInstance
        .collection('produto')
        .add(serviceModel.toMap())
        .then((value) {
      return true;
    }).catchError((error) => throw error);
  }
}
