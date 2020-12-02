import 'package:flutter/material.dart';

import '../../core/colors.dart';

class ChatSendButton extends StatelessWidget {
  final VoidCallback onPressEvent;
  ChatSendButton({@required this.onPressEvent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          onPressEvent();
        },
        color: themeColor,
      ),
    );
  }
}
