import 'package:flutter/material.dart';

class ChatProfileDescription extends StatelessWidget {
  final String nome;
  final String descricao;
  ChatProfileDescription({@required this.nome, @required this.descricao});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          nome,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Text(
          descricao,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ],
    );
  }
}
