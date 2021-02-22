import 'package:flutter/material.dart';

Widget anunciante() {
  return Row(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Anunciante: Joãozinho",
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
