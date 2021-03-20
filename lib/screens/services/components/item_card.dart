import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/navigation.dart';

class ItemCard extends StatelessWidget {
  final String service;
  final String hour;
  final String amount;
  final String imgUrl;
  final Function press;

  const ItemCard(
      {@required this.hour,
      @required this.service,
      @required this.amount,
      @required this.imgUrl,
      this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: themeColor,
          onTap: () {
            navigateToExchangeDetailsScreen(context);
          },
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  imgUrl,
                  scale: 2.0,
                ),
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
