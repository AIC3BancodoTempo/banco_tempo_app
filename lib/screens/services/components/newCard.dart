import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  final String service;
  final String hour;
  final String amount;
  final String imgUrl;
  final Function press;

  const NewCard({
    @required this.hour,
    @required this.service,
    @required this.amount,
    @required this.imgUrl,
    this.press});

  @override
  Widget build(BuildContext context) {
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
                Image.network(imgUrl, scale: 2.0,),
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
