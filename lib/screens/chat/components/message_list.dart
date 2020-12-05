import 'package:flutter/material.dart';

import 'message_area.dart';

class ChatMessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController listScrollController = ScrollController();
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        itemBuilder: (context, index) {
          return ChatMessageArea(
            recebidoEnviado: index % 2 == 0,
            visualizado: true,
            fromImageUrl:
                "https://i.pinimg.com/originals/fa/34/07/fa3407bbfc876fd7e1019238c5b6984f.jpg",
            datetime: DateTime.now(),
            message: 'Meu sorvete',
          );
        },
        itemCount: 6,
        reverse: true,
        controller: listScrollController,
      ),
    );
  }
}
