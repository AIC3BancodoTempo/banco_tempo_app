import 'package:flutter/material.dart';

import '../../../core/models/troca_model.dart';
import '../../core/navigation.dart';

class CardTrocas extends StatelessWidget {
  final String fotoContato, nome, ultimaMensagem;

  CardTrocas({Key key, this.fotoContato, this.nome, this.ultimaMensagem})
      : super(key: key);
  @override
  Widget build(context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              navigateToChatScreen(
                  context,
                  TrocaModel(
                      userConsumerId: "wWwPf2qqN7cJdzfpzeNBxe8uOfb2",
                      userConsumerName: 'Alexandre',
                      productId: '123',
                      productName: "Yoga",
                      salaId: "1232456",
                      status: 0,
                      userPostId: "kdmWiXSXeVYu3SBWXmg7lK8lzI73",
                      userPostName: 'André'));
            },
            leading: CircleAvatar(
                radius: 40.0, backgroundImage: NetworkImage(this.fotoContato)),
            title: Text(this.nome),
            subtitle: Text(
              this.ultimaMensagem,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
