import 'package:banco_do_tempo_app/core/models/questionary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../core/colors.dart';

import '../../blocs/auth/auth_bloc.dart';
import 'components/questions.dart';
import 'components/terms_button.dart';
import '../core/rounded_button.dart';

class QuestionaryScreen extends StatelessWidget {
  final AuthBloc authBloc;

  QuestionaryScreen({Key key, @required this.authBloc}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final myFocusNode = new FocusNode();
  final QuestionaryModel questionaryModel = QuestionaryModel();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              authBloc.add(ExitEvent());
            }),
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text("Questionário"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
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
                  height: 20,
                ),
                CustomDropdown(
                  opcoes: questionaryModel.opcoes,
                  pergunta: questionaryModel.perguntas[0],
                  resposta: questionaryModel.respostas[0],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropdown(
                  opcoes: questionaryModel.opcoes2,
                  pergunta: questionaryModel.perguntas[1],
                  resposta: questionaryModel.respostas[1],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropdown(
                  opcoes: questionaryModel.opcoes3,
                  pergunta: questionaryModel.perguntas[2],
                  resposta: questionaryModel.respostas[2],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropdown(
                  opcoes: questionaryModel.opcoes4,
                  pergunta: questionaryModel.perguntas[3],
                  resposta: questionaryModel.respostas[3],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropdown(
                  opcoes: questionaryModel.opcoes5,
                  pergunta: questionaryModel.perguntas[4],
                  resposta: questionaryModel.respostas[4],
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
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Analisando respostas...')));
                    if (_formKey.currentState.validate()) {
                      authBloc.add(SignupEvent());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
