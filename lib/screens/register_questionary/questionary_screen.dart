import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../core/custom_form_submit_button.dart';
import '../core/custom_text_form_field.dart';

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
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(33.0, 108.0, 0.0, 1.0),
                  child: Text('Responda!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DM Sans',
                          fontStyle: FontStyle.normal,
                          fontSize: 24)),
                ),
              ),
            ),
            Align(
              child: CustomTextFormField(
                question: 'Pergunta A',
                hintText: 'Responda',
                onChanged: (value) {},
              ),
            ),
            Align(
                child: CustomTextFormField(
              question: 'Pergunta B',
              hintText: 'Responda',
              onChanged: (value) {},
            )),
            Align(
              child: CustomTextFormField(
                question: 'Pergunta C',
                hintText: 'Responda',
                onChanged: (value) {},
              ),
            ),
            Align(
              child: CustomTextFormField(
                question: 'Pergunta D',
                hintText: 'Responda',
                onChanged: (value) {
                  //print(value);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(33.0, 28.0, 33.0, 2.0),
                  child: Text(
                    'Responda o quiz com base nos TERMOS para obter acesso!',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'DM Sans',
                        letterSpacing: 0.4,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
            Align(
              child: CustomFormSubmitButton(onPressed: () {
                if (_formKey.currentState.validate()) {
                  authBloc.add(SignupEvent());
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
