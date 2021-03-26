import 'package:flutter/material.dart';

class AnuncianteText extends StatelessWidget {
  final String text;

  const AnuncianteText({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Anunciante: ' + text,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)),
          ),
        )
      ],
    );
  }
}
