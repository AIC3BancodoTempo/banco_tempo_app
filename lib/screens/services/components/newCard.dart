import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  final String service;
  final String hour;
  final String amount;
  final Function press;

  const NewCard({
    Key key,
    this.hour,
    this.service,
    this.amount,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Card(
          child: InkWell(
            splashColor: Colors.purpleAccent,onTap: () {
            print('Card tapped.');
          },
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://flutter.io/images/catalog-widget-placeholder.png"),
                Text(service),
                Text(hour),
                Text(amount),
              ],
            ),
          ),
        ),
        ),
    );
  }
}
