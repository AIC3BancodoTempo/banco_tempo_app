import 'package:banco_do_tempo_app/screens/cadastros_e_descricaoCard/cadastro_habilidade.dart';
import 'package:banco_do_tempo_app/screens/cadastros_e_descricaoCard/descricao_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyCustomForm(),
    );
  }
}
