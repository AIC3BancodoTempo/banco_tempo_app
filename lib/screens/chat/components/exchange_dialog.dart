import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import 'dialog_icon.dart';
import 'exchange_dialog_body.dart';

buildExchangeDialog(BuildContext context, ChatBloc chatBloc, String nome,
    int unidade, int horasUtilizadas) {
  showDialog(
    context: context,
    builder: (BuildContext context) => CustomDialog(
        chatBloc: chatBloc,
        horasUtilizadas: horasUtilizadas,
        nome: nome,
        unidade: unidade),
  );
}

class CustomDialog extends StatelessWidget {
  final ChatBloc chatBloc;
  final String nome;
  final int unidade;
  final int horasUtilizadas;

  CustomDialog(
      {@required this.chatBloc,
      @required this.nome,
      @required this.unidade,
      @required this.horasUtilizadas});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    const double padding = 16.0;
    const double avatarRadius = 40.0;
    return Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: avatarRadius + padding,
          left: padding,
          right: padding,
        ),
        margin: EdgeInsets.only(top: avatarRadius),
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              )
            ]),
        child: ExchangeDialogBody(
          chatBloc: chatBloc,
          horasUtilizadas: horasUtilizadas,
          nome: nome,
          unidade: unidade,
        ),
      ),
      ChatDialogIcon(icon: Icons.multiple_stop_sharp),
    ]);
  }
}
