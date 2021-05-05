import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthRepository {
  FirebaseAuth _firebaseAuth;

  AuthRepository() {
    this._firebaseAuth = FirebaseAuth.instance;
  }
  Future<User> createUserWithEmailPass(String email, String pass) async {
    try {
      UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      authResult.user.sendEmailVerification();
      return authResult.user;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  // sign in with email and password
  Future<User> signInEmailAndPassword(String email, String password) async {
    try {
      var authresult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authresult.user;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> requestNewPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _firebaseAuth.signInWithCredential(credential);

  Stream<User> getCurrentUser() => _firebaseAuth.authStateChanges();

  Future<User> getUser() async {
    //Stream stream = _firebaseAuth.userChanges();
    User user = _firebaseAuth.currentUser;
    return user;
  }
}
