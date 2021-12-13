import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

class CardProdutoTalento extends StatefulWidget {
  const CardProdutoTalento({ Key key }) : super(key: key);

  @override
  _CardProdutoTalentoState createState() => _CardProdutoTalentoState();
}

class _CardProdutoTalentoState extends State<CardProdutoTalento> {

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        height: 175,
        width:175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: Image.network(
                "https://blog.thony.com.br/wp-content/uploads/2018/11/como-cortar-a-grama.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 22),
              child: Text(
                "Nome produto/talento",
                style: TextStyle(
                  color: Colors.grey[500], 
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("5 und",style: TextStyle(color: themeColor,fontSize: 15),),
                  Text("1.0 horas",style: TextStyle(color: themeColor,fontSize: 15)),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}