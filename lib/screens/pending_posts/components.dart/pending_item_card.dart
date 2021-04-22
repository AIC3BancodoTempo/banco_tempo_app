import 'package:flutter/material.dart';

import '../../../core/models/produto_model.dart';

class PendingItemCard extends StatelessWidget {
  final ProdutoModel product;
  final Function acceptPressed;
  final Function rejectPressed;

  const PendingItemCard({
    @required this.product,
    this.acceptPressed,
    this.rejectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.black12),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.userPostName,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                product.productName,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        acceptPressed(product.productId);
                      },
                      child: Text("Aceitar")),
                  SizedBox(width: 30.0),
                  TextButton(
                      onPressed: () {
                        rejectPressed(product.productId);
                      },
                      child: Text("Rejeitar")),
                ],
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                      product.images.length > 0 ? product.images[0] : "")),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(product.productQuantity.toString() + " und"),
                  SizedBox(width: 30.0),
                  Text(product.custoHoras.toString() + " hora"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
