import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

class ChatDialogIcon extends StatelessWidget {
  final IconData icon;
  ChatDialogIcon({@required this.icon});

  @override
  Widget build(BuildContext context) {
    const double padding = 16.0;
    const double avatarRadius = 40.0;
    return Positioned(
      left: padding,
      right: padding,
      child: CircleAvatar(
        backgroundColor: chatActionsColor.withOpacity(0.9),
        radius: avatarRadius,
        child: Icon(icon, color: Colors.white, size: 50),
      ),
    );
  }
}
