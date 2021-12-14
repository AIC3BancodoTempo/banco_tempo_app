import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

class CardProdutoTalento extends StatefulWidget {

  final List<dynamic> imagem;
  final String nome;
  final int quantidade;
  final num horas;

  CardProdutoTalento({ Key key, this.imagem, this.nome, this.quantidade, this.horas }) : super(key: key);

  @override
  _CardProdutoTalentoState createState() => _CardProdutoTalentoState();
}

class _CardProdutoTalentoState extends State<CardProdutoTalento> {


  @override
  
  Widget build(BuildContext context) {
    String img = "";
    try {
    img = widget.imagem[0];
  } catch (e) {
    img = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQChBDtDqstMB0SDouMEzlGL8AJmAULEUbxBBJe9vYM3TxSVsmybYyHyFTteUZi-fkJOu0&usqp=CAU";
  }
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
                img,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 22),
              child: Text(
                widget.nome,
                overflow: TextOverflow.ellipsis,
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
                  Text(widget.quantidade.toString()+" und",style: TextStyle(color: themeColor,fontSize: 15),),
                  Text(widget.horas.toString()+" horas",style: TextStyle(color: themeColor,fontSize: 15)),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}