import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../core/custom_text_form_field.dart';
import '../core/rounded_button.dart';
import 'components/terms_button.dart';

class QuestinaryScreen extends StatelessWidget {
  final AuthBloc authBloc;

  QuestinaryScreen({Key key, @required this.authBloc}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text('Responda para concluir o seu cadastro!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DM Sans',
                          fontStyle: FontStyle.normal,
                          fontSize: 24)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                question: 'Pergunta A',
                hintText: 'Responda',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                question: 'Pergunta B',
                hintText: 'Responda',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                question: 'Pergunta C',
                hintText: 'Responda',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                question: 'Pergunta D',
                hintText: 'Responda',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              TermsButton(
                onpress: () {},
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                text: "ACESSE",
                onpress: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Analisando respostas...')));
                    authBloc.add(SignupEvent());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
