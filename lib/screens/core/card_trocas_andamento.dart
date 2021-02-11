import 'package:flutter/material.dart';

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
