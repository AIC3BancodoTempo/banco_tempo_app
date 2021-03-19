import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorCodes {
  static const String ERROR_PERMISSION_DENIED = "permission-denied";
}

class FirebaseErrorMessages {
  static const String ERROR_PERMISSION_DENIED =
      "Permissão de acesso negada ao recurso!";
}

String firebaseErrorHandler(FirebaseException e) {
  String authError = "";
  switch (e.code) {
    case FirebaseErrorCodes.ERROR_PERMISSION_DENIED:
      authError = FirebaseErrorMessages.ERROR_PERMISSION_DENIED;
      break;
    default:
      authError = e.code + ' - ' + e.message;
      break;
  }
  return authError;
}
