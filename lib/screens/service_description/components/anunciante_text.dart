import 'package:flutter/material.dart';

class AnuncianteText extends StatelessWidget {
  final String text;
  final bool isSolicitante;

  const AnuncianteText(
      {Key key, @required this.text, this.isSolicitante = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              isSolicitante ? 'Solicitante: ' + text : 'Anunciante: ' + text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)),
            ),
          )
        ],
      ),
    );
  }
}
