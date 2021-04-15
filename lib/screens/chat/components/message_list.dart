import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../../core/models/chat_model.dart';
import 'confirmation_buble.dart';
import 'message_area.dart';

class ChatMessageList extends StatelessWidget {
  final ScrollController listScrollController;
  final ChatBloc chatBloc;
  final List<ChatModel> listMessages;
  final String userId;

  const ChatMessageList(
      {Key key,
      this.listScrollController,
      this.listMessages,
      this.userId,
      this.chatBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        itemBuilder: (context, index) {
          if (listMessages[index].type == 0) {
            return ChatMessageArea(
              chatModel: listMessages[index],
              userId: userId,
            );
          } else if (listMessages[index].type == 1) {
            chatBloc.setNoExchange();
            return ConfirmationMessage(
                chatBloc: chatBloc, chatModel: listMessages[index]);
          } else {
            return Container();
          }
        },
        itemCount: listMessages.length,
        reverse: true,
        controller: listScrollController,
      ),
    );
  }
}
