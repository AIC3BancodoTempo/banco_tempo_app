import 'package:flutter/material.dart';

import '../../core/navigation.dart';

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
              Expanded(
                flex: 3,
                child: Container(
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgUrl), fit: BoxFit.fitHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(15),
                        topStart: Radius.circular(15),
                      ),
                    ),
                  ),
                  width: double.maxFinite,
                  height: 100,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  hour,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  ' unidades',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  amount,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  " horas",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
