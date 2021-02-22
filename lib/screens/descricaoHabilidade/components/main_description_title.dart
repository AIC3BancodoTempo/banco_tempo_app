import 'package:flutter/material.dart';

Widget title() {
  return Container(
    child: Column(
      children: <Widget>[
        Text(
          "Bolo + Hidratante",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F2F3E)),
        ),
        Text(
          "1 Hora",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFA95EFA),
          ),
        ),
      ],
    ),
  );
}
