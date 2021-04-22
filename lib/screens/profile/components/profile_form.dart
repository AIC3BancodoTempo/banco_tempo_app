import 'package:banco_do_tempo_app/screens/core/custom_text_form_field.dart';
import 'package:banco_do_tempo_app/screens/core/rounded_button.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  final Function redefinePassword;
  final String hintEmail;
  final String hintName;

  const ProfileForm(
      {Key key, this.redefinePassword, this.hintEmail, this.hintName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CustomTextFormField(
            enabled: false,
            icon: Icon(Icons.email),
            hintText: "E-mail",
            onChanged: null,
            question: hintEmail,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            enabled: false,
            icon: Icon(Icons.person),
            onChanged: null,
            question: hintName,
            hintText: 'Name',
          ),
          SizedBox(
            height: 50,
          ),
          RoundedButton(
            text: "Redefinir Senha",
            onpress: redefinePassword,
          ),
        ],
      ),
    );
  }
}
