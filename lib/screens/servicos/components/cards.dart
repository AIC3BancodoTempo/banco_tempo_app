import 'package:flutter/material.dart';

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
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text('Aula de Yoga'),
                Text('1 Hora'),
                Text('1 unid'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
