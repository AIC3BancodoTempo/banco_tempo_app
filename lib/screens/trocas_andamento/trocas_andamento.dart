import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/card_trocas_andamento.dart';

class TrocasAndamento extends StatefulWidget {
  @override
  _TrocasAndamento createState() => _TrocasAndamento();
}

class _TrocasAndamento extends State<TrocasAndamento> {
  final List<Map<String, dynamic>> _mockupContato = [
    {
      'fotoContato':
          'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png',
      'nome': 'Edinaldo Pereira',
      'ultimaMensagem': 'Você não vale nada, você vale tudo.'
    },
    {
      'fotoContato':
          'https://pbs.twimg.com/profile_images/1293925081542995971/s2la3KS9.png',
      'nome': 'Edinaldo Pereira',
      'ultimaMensagem': 'Jogue somente para ganhar, e não para perder.'
    },
    {
      'fotoContato':
          'https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/c/4/e/9/c4e987143a79ddc7769d979b49d86456.jpg',
      'nome': 'Edinaldo Pereira',
      'ultimaMensagem': 'Banido desbanido, Banido.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("Trocas em andamento"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _mockupContato.length,
          itemBuilder: (BuildContext context, int index) {
            return CardTrocas(
              fotoContato: _mockupContato[index]["fotoContato"],
              nome: _mockupContato[index]["nome"],
              ultimaMensagem: _mockupContato[index]["ultimaMensagem"],
            );
          }),
    );
  }
}
