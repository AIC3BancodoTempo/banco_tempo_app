import 'package:firebase_auth/firebase_auth.dart';

class AuthErrorCodes {
  static const String ERROR_C0DE_NETWORK_ERROR = "FirebaseException";
  static const String ERROR_USER_NOT_FOUND = "user-not-found";
  static const String ERROR_INVALID_EMAIL = "invalid-email";
  static const String ERROR_CODE_WRONG_PASSWORD = "wrong-password";
  static const String ERROR_CODE_EMAIL_ALREADY_IN_USE = "email-already-in-use";
  static const String ERROR_OPERATION_NOT_ALLOWED = "operation-not-allowed";
  static const String ERROR_CODE_WEAK_PASSWORD = "invalid-password";
  static const String ERROR_TOO_MANY_REQUESTS = "too-many-requests";
  static const String ERROR_CODE_USER_DISABLED = "user-disabled";
  static const String ERROR_PERMISSION_DENIED = "permission-denied";
}

class AuthErrorMessages {
  static const String ERROR_C0DE_NETWORK_ERROR =
      "Erro de rede! Verifique a conexão com a internet.";
  static const String ERROR_USER_NOT_FOUND = "Usuário não encontrado!";
  static const String ERROR_INVALID_EMAIL = "E-mail inválido!";
  static const String ERROR_CODE_WRONG_PASSWORD = "Senha inválida!";
  static const String ERROR_PERMISSION_DENIED =
      "Permissão de acesso negada ao recurso!";
  static const String ERROR_CODE_EMAIL_ALREADY_IN_USE =
      "O e-mail fornecido já está em uso por outro usuário!";
  static const String ERROR_OPERATION_NOT_ALLOWED =
      "O provedor de login fornecido está desativado para o projeto do Firebase!";
  static const String ERROR_CODE_WEAK_PASSWORD =
      "O valor fornecido para a propriedade do usuário password é inválido. Precisa ser uma string com pelo menos seis caracteres!";
  static const String ERROR_TOO_MANY_REQUESTS =
      "Foram realizadas muitas requisições seguidas aguarde e tente novamente mais tarde!";
  static const String ERROR_CODE_USER_DISABLED = "Usuário desativado";
}

String authErrorHandler(FirebaseAuthException e) {
  String authError = "";
  switch (e.code) {
    case AuthErrorCodes.ERROR_C0DE_NETWORK_ERROR:
      authError = AuthErrorMessages.ERROR_C0DE_NETWORK_ERROR;
      break;
    case AuthErrorCodes.ERROR_USER_NOT_FOUND:
      authError = AuthErrorMessages.ERROR_USER_NOT_FOUND;
      break;
    case AuthErrorCodes.ERROR_TOO_MANY_REQUESTS:
      authError = AuthErrorMessages.ERROR_TOO_MANY_REQUESTS;
      break;
    case AuthErrorCodes.ERROR_INVALID_EMAIL:
      authError = AuthErrorMessages.ERROR_INVALID_EMAIL;
      break;
    case AuthErrorCodes.ERROR_CODE_USER_DISABLED:
      authError = AuthErrorMessages.ERROR_CODE_USER_DISABLED;
      break;
    case AuthErrorCodes.ERROR_CODE_WRONG_PASSWORD:
      authError = AuthErrorMessages.ERROR_CODE_WRONG_PASSWORD;
      break;
    case AuthErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
      authError = AuthErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
      break;
    case AuthErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
      authError = AuthErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
      break;
    case AuthErrorCodes.ERROR_CODE_WEAK_PASSWORD:
      authError = AuthErrorMessages.ERROR_CODE_WEAK_PASSWORD;
      break;
    case AuthErrorCodes.ERROR_PERMISSION_DENIED:
      authError = AuthErrorMessages.ERROR_PERMISSION_DENIED;
      break;
    default:
      authError = e.code + ' - ' + e.message;
      break;
  }
  return authError;
}
