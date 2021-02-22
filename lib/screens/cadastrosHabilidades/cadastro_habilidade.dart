import 'package:flutter/material.dart';

import '../core/appBar.dart';
import '../core/main_button.dart';
import 'components/add_image_button.dart';
import 'components/insert_input_texts.dart';
import 'components/title_add_text.dart';

class AddAbilityPage extends StatefulWidget {
  @override
  AddAbilityPageState createState() {
    return AddAbilityPageState();
  }
}

class AddAbilityPageState extends State<AddAbilityPage> {
  final _formKey = GlobalKey<FormState>();
  final myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Descrição'),
      body: new SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              titleAddText(
                  'Adicione uma habilidade, serviço ou o que está procurando.'),
              insertInputs(
                'Nome',
              ),
              insertInputs(
                'Quantia em Horas',
              ),
              insertInputs(
                'Descrição',
              ),
              insertInputs(
                'Quantidade Disponível',
              ),
              SizedBox(height: 50.0),
              ImageInclude(),
              SizedBox(height: 30.0),
              mainButton("CADASTRAR", Icons.login_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
