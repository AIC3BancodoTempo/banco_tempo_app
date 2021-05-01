import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../../core/models/chat_model.dart';
import '../../core/colors.dart';
import '../../core/image_view.dart';

class ConfirmationMessage extends StatelessWidget {
  final ChatBloc chatBloc;
  final ChatModel chatModel;
  ConfirmationMessage({@required this.chatBloc, @required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 5,
        ),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                chatBloc.user.uid == chatModel.fromId || chatModel.type == 2
                    ? "Confirmação de troca"
                    : "Confirmar a troca?",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Nome: " + chatBloc.trocaModel.userPostName,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Unidade: " + chatBloc.trocaModel.amount.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Consumo de horas: " + chatBloc.trocaModel.cost.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            chatModel.url.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ImageView(
                              imageProvider: NetworkImage(chatModel.url),
                            ),
                          ),
                        );
                      },
                      child: Image.network(
                        chatModel.url,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  )
                : Container(),
            chatBloc.user.uid != chatModel.fromId && chatModel.type != 2
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        chatBloc.add(ExchangeEvent(id: chatModel.key));
                      },
                      child: Text(
                        "Trocar",
                        style: TextStyle(color: themeColor),
                      ),
                    ),
                  )
                : Container(),
          ]),
    );
  }
}
