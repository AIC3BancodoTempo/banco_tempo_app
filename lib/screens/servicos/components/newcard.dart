import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  final String servico;
  final String hora;
  final String unidade;
  final Function press;

  const NewCard({
    Key key,
    this.hora,
    this.servico,
    this.unidade,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: GestureDetector(
        onTap: press,
        child: Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text(servico),
                Text(hora),
                Text(unidade),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
