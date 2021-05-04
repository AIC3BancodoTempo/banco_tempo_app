import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  final VoidCallback onPressEvent;
  ReturnButton({this.onPressEvent});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
      ),
    );
  }
}
