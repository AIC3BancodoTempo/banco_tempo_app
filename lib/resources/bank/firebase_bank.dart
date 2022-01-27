import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/models/bank_model.dart';

class BankRepository {
  FirebaseFirestore firestoreInstance;

  BankRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  // Cria as informações no banco de dados

  Future<BankModel> createInfo(double horas) async {
    return await firestoreInstance.collection('bank').doc('info').set({
      'horas': 0,
    }).then((value) {
      return BankModel(horas: 0);
    }).catchError((error) => throw error);
  }

  // Ler as informações do banco

  Future<BankModel> readinfo() async {
    BankModel model;
    try {
      DocumentSnapshot snapshot =
          await firestoreInstance.collection('bank').doc('info').get();
      if (snapshot.exists) {
        model = BankModel.fromSnapshot(snapshot.data());
      }
    } catch (error) {
      throw error;
    }
    return model;
  }

  // Adiciona horas ao banco

  Future<bool> addHoras(double horas) async {
    return await firestoreInstance.collection('bank').doc('info').update({
      'horas': FieldValue.increment(horas),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  // Remove horas do banco

  Future<bool> removeHoras(double horas) async {
    return await firestoreInstance.collection('bank').doc('info').update({
      'horas': FieldValue.increment(-horas),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  //

  List<BankModel> _listaInfo(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return BankModel(horas: e.get('horas') ?? "");
    }).toList();
  }

  Stream<List<BankModel>> get info {
    return firestoreInstance.collection('bank').snapshots().map(_listaInfo);
  }
}
