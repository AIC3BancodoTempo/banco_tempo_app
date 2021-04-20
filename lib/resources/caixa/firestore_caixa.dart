import 'package:cloud_firestore/cloud_firestore.dart';

class CaixaRepository {
  FirebaseFirestore firestoreInstance;

  CaixaRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<bool> addCaixa() async {
    return await firestoreInstance
        .collection('caixa')
        .doc(await firestoreInstance.collection('caixa').get().then((value) {
          return value.docs.first.id;
        }))
        .update({'valor': FieldValue.increment(16)}).then((value) {
      return true;
    }).catchError((error) => throw error);
  }
}
