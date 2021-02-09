import 'package:banco_do_tempo_app/screens/core/button.dart';
import 'package:flutter/material.dart';
import 'components/fields.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
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
              descriptionText(
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
              photoInclude(),
              mainButton(),
            ],
          ),
        ),
      ),
    );
  }
}
