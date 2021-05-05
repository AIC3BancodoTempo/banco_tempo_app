import 'package:flutter/material.dart';

import '../../../core/models/service_model.dart';
import '../../core/navigation.dart';
import 'card_detail.dart';
import 'image_card.dart';

class ItemCard extends StatelessWidget {
  final ServiceModel product;

  const ItemCard({
    @required this.product,
  });

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
            navigateToServiceDescriptionScreen(context, product);
          },
          child: Column(
            children: [
              ImageCard(
                  imgUrl: product.images.length > 0 ? product.images[0] : ""),
              CardDetails(
                  title: product.productName,
                  hour: product.custoHoras,
                  amount: product.productQuantity),
            ],
          ),
        ),
      ),
    );
  }
}
