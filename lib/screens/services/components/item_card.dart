import 'package:flutter/material.dart';

import '../../core/navigation.dart';
import 'card_detail.dart';
import 'image_card.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String hour;
  final String amount;
  final String imgUrl;
  final Function press;

  const ItemCard(
      {@required this.hour,
      @required this.title,
      @required this.amount,
      @required this.imgUrl,
      this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 14,
        semanticContainer: true,
        shadowColor: Colors.black45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            navigateToExchangeDetailsScreen(context);
          },
          child: Column(
            children: [
              ImageCard(imgUrl: imgUrl),
              CardDetails(title: title, hour: hour, amount: amount),
            ],
          ),
        ),
      ),
    );
  }
}
