import 'package:flutter/material.dart';
import 'components/cards.dart';
import 'components/buttons.dart';

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
          Cards(),
          Buttons(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.purple),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text("item 1"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
