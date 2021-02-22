import 'package:flutter/material.dart';

Widget chips() {
  return Wrap(
    spacing: 100.0,
    children: [
      new Chip(
        label: Text('1 Unidade'),
      ),
      new Chip(
        label: Text('1 Hora'),
      ),
    ],
  );
}
