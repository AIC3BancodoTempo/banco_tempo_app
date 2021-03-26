import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/user_model.dart';

class UsersRepository {
  FirebaseFirestore firestoreInstance;

  UsersRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<UserModel> insertUser(String userId, String email, String nome) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'horas': 22,
      'email': email,
      'is_admin': false,
      'nome': nome,
      'reports': 0
    }).then((value) {
      return UserModel(
          email: email, horas: 22, isAdmin: false, nome: nome, reports: 0);
    }).catchError((error) => throw Exception(error));
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
      throw Exception(error);
    }
    return model;
  }
}
