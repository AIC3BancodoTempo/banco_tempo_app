//import 'package:banco_do_tempo_app/core/models/service_model.dart';
import 'package:banco_do_tempo_app/core/models/userService_model.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart';

class CardProdutoTalento extends StatefulWidget {
  final UserService service;

  ///final List<dynamic> imagem;
  ///final String nome;
  ///final int quantidade;
  ///final num horas;

  CardProdutoTalento({Key key, this.service}) : super(key: key);

  @override
  _CardProdutoTalentoState createState() => _CardProdutoTalentoState();
}

class _CardProdutoTalentoState extends State<CardProdutoTalento> {
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 175,
          width: 175,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                  width: double.infinity,
                  child: widget.service.imagem != null
                      ? Image.network(
                          widget.service.imagem[0],
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/noimage.jpg',
                          fit: BoxFit.cover,
                        )),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 22),
                child: Text(
                  widget.service.nome,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.service.quantidade.toString() + " und",
                      style: TextStyle(color: themeColor, fontSize: 15),
                    ),
                    Text(widget.service.horas.toString() + " horas",
                        style: TextStyle(color: themeColor, fontSize: 15)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
