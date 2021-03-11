import 'package:flutter/material.dart';
import 'newcard.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: <Widget>[
        NewCard(
          hora: '1 hora',
          servico: 'Aula de Violão',
          unidade: '1 unidade',
          press: () {},
        ),
      ],
    );
  }
}
