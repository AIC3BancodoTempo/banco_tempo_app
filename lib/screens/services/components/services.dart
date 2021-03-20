import 'package:flutter/material.dart';
import 'package:banco_do_tempo_app/screens/services/components/cards.dart';

class Services extends StatelessWidget {
  Services({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Serviços/Habilidades'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Cards()
        ],
      ),
    );
  }
}
