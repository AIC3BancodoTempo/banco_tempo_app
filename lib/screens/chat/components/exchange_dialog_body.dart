import 'dart:io';

import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../core/circle_button.dart';
import '../../core/colors.dart';
import '../../core/image_picker.dart';

class ExchangeDialogBody extends StatelessWidget {
  final ChatBloc chatBloc;
  final String nome;
  final int unidade;
  final int horasUtilizadas;

  ExchangeDialogBody(
      {@required this.chatBloc,
      @required this.nome,
      @required this.unidade,
      @required this.horasUtilizadas});

  loadImageEvent(File image) {
    chatBloc.add(UploadImageEvent(image: image));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Confirmar a troca?",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Nome: " + nome,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Unidade: " + unidade.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Consumo de horas: " + horasUtilizadas.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Anexe uma foto da troca: ",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                CircleButton(
                    onPressEvent: () {
                      showImagePicker(context, loadImageEvent);
                    },
                    icon: Icons.add),
              ],
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () {
                  chatBloc.add(ExchangeEvent());
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Trocar",
                  style: TextStyle(color: themeColor),
                ),
              ),
            ),
          ]),
    );
  }
}
