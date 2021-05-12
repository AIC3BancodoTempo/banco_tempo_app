import 'package:flutter/material.dart';

import '../colors.dart';

class AppBarAction extends StatelessWidget {
  final VoidCallback onPressEvent;
  final IconData icon;
  AppBarAction({@required this.onPressEvent, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        color: themeColor,
        child: IconButton(
          color: Colors.white,
          icon: Icon(icon),
          iconSize: 25.0,
          onPressed: () {
            onPressEvent();
          },
        ),
      ),
    );
  }
}
