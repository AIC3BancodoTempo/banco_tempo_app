import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/produto_model.dart';

class HabilityRepository {
  FirebaseFirestore firestoreInstance;

  HabilityRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<List<ProdutoModel>> receiveHability(int status) async {
    List<ProdutoModel> productList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('produto')
        .where('status', isEqualTo: status)
        .orderBy('timestamp', descending: true)
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
}
