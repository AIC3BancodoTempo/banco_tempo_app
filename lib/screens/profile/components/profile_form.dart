import 'package:banco_do_tempo_app/screens/core/custom_form_submit_button.dart';
import 'package:banco_do_tempo_app/screens/core/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "E-mail",
            onChanged: null,
            question: "Digite seu E-mail",
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: "myusername",
            onChanged: null,
            question: "Nome de Usuário",
          ),
          SizedBox(
            height: 20,
          ),
          CustomFormSubmitButton(
            onPressed: null,
            text: "Redefinir Senha",
          ),
        ],
      ),
    );
  }
}
