import 'package:flutter/material.dart';

import '../../../core/models/troca_model.dart';
import '../../core/navigation.dart';

class CardTrocas extends StatelessWidget {
  final TrocaModel trocaModel;
  final String userId;

  CardTrocas({Key key, this.trocaModel, this.userId}) : super(key: key);
  @override
  Widget build(context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              navigateToChatScreen(context, trocaModel);
            },
            leading: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage("assets/images/profile.png")),
            title: Text(userId == trocaModel.userConsumerId
                ? trocaModel.userPostName
                : trocaModel.userConsumerName),
            subtitle: Text(
              trocaModel.mensagem != null
                  ? trocaModel.mensagem.content
                  : "Conversa não iniciada",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
