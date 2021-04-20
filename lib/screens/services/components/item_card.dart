import 'package:flutter/material.dart';

import '../../../core/models/produto_model.dart';
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
