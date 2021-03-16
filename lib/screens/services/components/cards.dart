import 'package:flutter/material.dart';
import 'package:banco_do_tempo_app/screens/services/components/newCard.dart';


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
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
        NewCard(
          hour: '1 hora',
          service: 'Aula de Violão',
          amount: '1 unidade',
          press: () {},
        ),
       
      ],
    );
  }
}
