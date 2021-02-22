import 'package:flutter/material.dart';

Widget description_title() {
  return Row(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Título do Texto",
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
