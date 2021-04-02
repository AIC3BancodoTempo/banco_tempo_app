import 'package:flutter/material.dart';

import '../../core/profile_image.dart';
import 'message_bubble.dart';
import 'message_date.dart';

class ChatMessageArea extends StatelessWidget {
  final String message;
  final DateTime datetime;
  final bool recebidoEnviado;
  final bool visualizado;
  final String fromImageUrl;

  ChatMessageArea(
      {@required this.message,
      @required this.datetime,
      @required this.recebidoEnviado,
      @required this.visualizado,
      @required this.fromImageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment:
            recebidoEnviado ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          ChatMessageDate(
            date: datetime,
            recebidoEnviado: recebidoEnviado,
          ),
          Stack(
              alignment: recebidoEnviado
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              children: [
                ChatMessageBubble(message: message),
                recebidoEnviado
                    ? Container()
                    : Align(
                        widthFactor: 0.2,
                        heightFactor: 0.5,
                        child: ProfileImage(radius: 10, image: fromImageUrl),
                      ),
                SizedBox(width: 10.0),
                recebidoEnviado
                    ? Align(
                        widthFactor: 0.4,
                        heightFactor: 0.1,
                        child: Icon(Icons.check,
                            color: visualizado ? Colors.blue : Colors.grey),
                      )
                    : Container()
              ]),
        ],
      ),
    );
  }
}
