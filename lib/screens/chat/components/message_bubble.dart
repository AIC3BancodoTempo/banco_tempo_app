import "package:flutter/material.dart";

class ChatMessageBubble extends StatelessWidget {
  final String message;
  ChatMessageBubble({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: SelectableText(
        message,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
