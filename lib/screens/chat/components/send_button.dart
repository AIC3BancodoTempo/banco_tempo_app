import 'package:flutter/material.dart';

import '../../core/colors.dart';

class ChatSendButton extends StatelessWidget {
  final VoidCallback onPressEvent;
  ChatSendButton({@required this.onPressEvent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 35),
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
