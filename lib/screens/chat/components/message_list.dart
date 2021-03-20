import '../../../core/models/chat_model.dart';
import 'package:flutter/material.dart';

import 'message_area.dart';

class ChatMessageList extends StatelessWidget {
  final ScrollController listScrollController;
  final List<ChatModel> listMessages;
  final String userId;

  const ChatMessageList(
      {Key key, this.listScrollController, this.listMessages, this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        itemBuilder: (context, index) {
          return ChatMessageArea(
            recebidoEnviado: listMessages[index].fromId == userId,
            visualizado: listMessages[index].visualizado,
            fromImageUrl:
                "https://i.pinimg.com/originals/fa/34/07/fa3407bbfc876fd7e1019238c5b6984f.jpg",
            datetime: DateTime.fromMillisecondsSinceEpoch(
                int.parse(listMessages[index].timestamp)),
            message: listMessages[index].content,
          );
        },
        itemCount: listMessages.length,
        reverse: true,
        controller: listScrollController,
      ),
    );
  }
}
