import 'package:flutter/material.dart';

import '../../core/colors.dart';

class ChatAppBarAction extends StatelessWidget {
  final VoidCallback onPressEvent;
  final IconData icon;
  ChatAppBarAction({@required this.onPressEvent, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        color: chatActionsColor,
        child: IconButton(
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
