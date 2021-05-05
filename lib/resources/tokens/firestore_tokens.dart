import 'package:cloud_firestore/cloud_firestore.dart';

class TokenRepository {
  FirebaseFirestore firestoreInstance;

  TokenRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }
  Future<String> getToken(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await firestoreInstance.collection('tokens').doc(userId).get();
      Map<String, dynamic> data = snapshot.data();
      if (data != null) {
        return data['token'];
      } else {
        return '-';
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> setToken(String userId, String token) async {
    await firestoreInstance
        .collection('tokens')
        .doc(userId)
        .set({'token': token}).then((value) {
      return true;
    }).catchError((error) => throw Exception(error));
    return false;
  }
}
