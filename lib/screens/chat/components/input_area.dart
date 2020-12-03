import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import 'send_button.dart';
import 'text_field.dart';

class ChatInputArea extends StatelessWidget {
  final ChatBloc chatBloc;
  final TextEditingController textEditingController = TextEditingController();

  ChatInputArea({@required this.chatBloc});

  void onSendMessage() {
    chatBloc.add(SendMessageEvent(message: textEditingController.text));
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChatTextField(textEditingController: textEditingController),
          ChatSendButton(onPressEvent: onSendMessage)
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: Colors.grey[200],
            width: 0.5,
          ),
          color: Colors.white),
    );
  }
}
