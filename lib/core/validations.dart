import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

bool validateAndSave(GlobalKey<FormState> formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}

String validateEmail(String value) {
  if (value.isEmpty)
    return 'Email não pode ser vazio!';
  else {
    return (EmailValidator.validate(value)) ? null : "Email inválido!";
  }
}

String validateSenha(String value) {
  if (value.isEmpty)
    return 'Senha não pode ser vazia!';
  else
    return value.length > 6 ? null : 'Senha deve conter mais de 6 caracteres';
}

String validateEmptyField(String value) {
  if (value.isEmpty)
    return 'Campo não pode ser vazio!';
  else {
    return null;
  }
}
