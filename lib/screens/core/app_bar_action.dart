import 'package:flutter/material.dart';

class AppBarAction extends StatelessWidget {
  final VoidCallback onPressEvent;
  AppBarAction({this.onPressEvent});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      iconSize: 30.0,
      onPressed: () {
        onPressEvent();
      },
    );
  }
}
