import 'package:banco_do_tempo_app/screens/core/custom_text_form_field.dart';
import 'package:banco_do_tempo_app/screens/core/rounded_button.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CustomTextFormField(
            icon: Icon(Icons.email),
            hintText: "E-mail",
            onChanged: null,
            question: "Digite seu E-mail",
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            icon: Icon(Icons.person),
            hintText: "myusername",
            onChanged: null,
            question: "Nome de Usuário",
          ),
          SizedBox(
            height: 50,
          ),
          RoundedButton(
            text: "Redefinir Senha",
            onpress: null,
          ),
        ],
      ),
    );
  }
}
