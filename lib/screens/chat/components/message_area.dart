import 'package:flutter/material.dart';

import '../../../core/models/chat_model.dart';
import '../../core/profile_image.dart';
import 'message_bubble.dart';
import 'message_date.dart';

class ChatMessageArea extends StatelessWidget {
  final ChatModel chatModel;
  final String userId;

  ChatMessageArea({
    @required this.chatModel,
    @required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    bool recebidoEnviado = chatModel.fromId == userId;
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 7),
      child: Column(
        crossAxisAlignment:
            recebidoEnviado ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          ChatMessageDate(
            date: DateTime.fromMillisecondsSinceEpoch(
                int.parse(chatModel.timestamp)),
            recebidoEnviado: recebidoEnviado,
          ),
          Stack(
              alignment: recebidoEnviado
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              children: [
                ChatMessageBubble(message: chatModel.content),
                recebidoEnviado
                    ? Container()
                    : Align(
                        widthFactor: 0.2,
                        heightFactor: 0.5,
                        child: ProfileImage(
                            radius: 10,
                            image:
                                "https://i.pinimg.com/originals/fa/34/07/fa3407bbfc876fd7e1019238c5b6984f.jpg"),
                      ),
                SizedBox(width: 10.0),
                recebidoEnviado
                    ? Align(
                        widthFactor: 0.4,
                        heightFactor: 0,
                        child: Icon(Icons.check,
                            color: chatModel.visualizado
                                ? Colors.blue
                                : Colors.grey),
                      )
                    : Container()
              ]),
        ],
      ),
    );
  }
}
