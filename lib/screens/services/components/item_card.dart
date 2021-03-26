import 'package:banco_do_tempo_app/core/models/produto_model.dart';
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
            //O ProdutoModel deve vir do bloc e não daqui
            navigateToExchangeDetailsScreen(
                context,
                ProdutoModel(
                    data: '15/03/2021',
                    productQuantity: 5,
                    custoHoras: 1,
                    productDescritpion: "abacaxi com pão é bom",
                    productId: "O25Ja6si2ewzCbeQI5IV",
                    productName: "Bolo chocolate",
                    status: 1,
                    userPostId: "Gh8ClGJ2Jjd3KtnJnGu37yA774u2",
                    userPostName: "Junior",
                    images: [
                      "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHByb2R1Y3R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
                      "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1542062283%2Fchocolate-and-cream-layer-cake-1812-cover.jpg%3Fitok%3DR_xDiShk"
                    ]));
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
