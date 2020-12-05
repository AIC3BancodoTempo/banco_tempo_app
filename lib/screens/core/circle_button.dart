import 'package:flutter/material.dart';

import 'colors.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressEvent;
  final IconData icon;
  CircleButton({@required this.onPressEvent, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: themeColor,
        child: IconButton(
          alignment: Alignment.center,
          color: Colors.white,
          icon: Icon(icon),
          iconSize: 30.0,
          onPressed: () {
            onPressEvent();
          },
        ),
      ),
    );
  }
}
