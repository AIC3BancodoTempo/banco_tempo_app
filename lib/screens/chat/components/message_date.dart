import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageDate extends StatelessWidget {
  final DateTime date;
  final bool recebidoEnviado;
  ChatMessageDate({@required this.date, @required this.recebidoEnviado});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment:
              recebidoEnviado ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM/yyyy kk:mm').format(date),
              style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
            ),
          ]),
      margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
    );
  }
}
