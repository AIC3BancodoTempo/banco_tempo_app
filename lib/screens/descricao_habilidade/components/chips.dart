import 'package:flutter/material.dart';

class Chips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
