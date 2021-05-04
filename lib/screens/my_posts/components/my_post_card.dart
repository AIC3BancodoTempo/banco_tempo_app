import 'package:banco_do_tempo_app/core/models/service_model.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final ServiceModel product;

  PostCard({
    Key key,
    this.product,
  }) : super(key: key);

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
              product.status == 0
                  ? Row(
                      children: [
                        Icon(Icons.timelapse),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Aguardando aprovação"),
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Postado"),
                      ],
                    ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.productName,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    product.productQuantity.toString() + " und",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 30.0),
                  Text(
                    product.custoHoras.toString() + " hora",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: product.images.isNotEmpty
                    ? NetworkImage(product.images[0])
                    : AssetImage('assets/images/noimage.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
