import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

showCustomAboutDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text(
      "SAIR",
      style: TextStyle(color: themeColor),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alerta = AlertDialog(
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    title: Row(
      children: [
        Image(
          image: AssetImage('assets/images/logo2.png'),
          height: 40,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 5),
        Text("Sobre o Banco do Tempo"),
      ],
    ),
    content: Text(
        "Aplicativo desenvolvido por alunos do curso de bacharel em Sistemas de Informação da Universidade Federal Do Rio Grande em parceria com o Banco do Tempo de Rio Grande."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
