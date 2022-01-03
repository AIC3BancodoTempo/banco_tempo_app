import 'package:flutter/material.dart';

class TitleAddText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Text(
              "Cadastre um Serviço, Evento ou Produto ou o que está procurando",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSans',
                  fontStyle: FontStyle.normal,
                  fontSize: 23)),
        ),
      ),
    );
  }
}
