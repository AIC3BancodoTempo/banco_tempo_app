import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/cupertino.dart';
import '../../core/models/user_model.dart';

class UsersRepository {


  FirebaseFirestore firestoreInstance;

  UsersRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<UserModel> insertUser(String userId, String email, String nome,) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'horas': 4,
      'email': email,
      'is_admin': false,
      'nome': nome,
      'reports': 0,
      "foto": ""
    }).then((value) {
      return UserModel(
          email: email, horas: 22, isAdmin: false, nome: nome, reports: 0, foto: "");
    }).catchError((error) => throw error);
  }

  Future<UserModel> getUserById(String id) async {
    UserModel model;
    try {
      DocumentSnapshot snapshot =
          await firestoreInstance.collection('users').doc(id).get();
      if (snapshot.exists) {
        model = UserModel.fromSnapshot(snapshot.data(), snapshot.id);
      }
    } catch (error) {
      throw error;
    }
    return model;
  }

  Future<bool> addHoras(String userId, double horas) async {
    return await firestoreInstance.collection('users').doc(userId).update({
      'horas': FieldValue.increment(horas),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<bool> removeHoras(String userId, double horas) async {
    return await firestoreInstance.collection('users').doc(userId).update({
      'horas': FieldValue.increment(-horas),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }



    List<UserModel> _listaUsuarios(QuerySnapshot snapshot){
    return snapshot.docs.map((e){
      return UserModel(
        nome: e.get("nome") ?? "",
        horas: e.get("horas") ?? ""
        );
      }
    ).toList();
  }

  Stream<List<UserModel>> get usuarios{
    return firestoreInstance.collection('users').snapshots().map(_listaUsuarios);
  }

}
