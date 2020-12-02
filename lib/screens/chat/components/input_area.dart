import 'package:banco_do_tempo_app/screens/chat/components/text_field.dart';
import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import 'send_button.dart';

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
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 35),
        child: Row(
          children: [
            ChatTextField(textEditingController: textEditingController),
            SizedBox(
              width: 16,
            ),
            ChatSendButton(onPressEvent: onSendMessage)
          ],
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey[200], width: 0.5),
            ),
            color: Colors.white),
      ),
    );
  }
}
