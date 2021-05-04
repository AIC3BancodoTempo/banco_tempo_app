import 'package:flutter/material.dart';

import '../../../core/models/exchange_model.dart';
import '../../core/navigation.dart';

class CardExchanges extends StatelessWidget {
  final ExchangeModel exchangeModel;
  final int tipo;

  CardExchanges({Key key, this.exchangeModel, this.tipo}) : super(key: key);
  @override
  Widget build(context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              navigateToChatScreen(context, exchangeModel);
            },
            leading: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage("assets/images/profile.png")),
            title: Text(tipo == 0
                ? exchangeModel.userPostName
                : exchangeModel.userConsumerName),
            subtitle: Text(
              exchangeModel.mensagem != null
                  ? exchangeModel.mensagem.content
                  : "Conversa não iniciada",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
