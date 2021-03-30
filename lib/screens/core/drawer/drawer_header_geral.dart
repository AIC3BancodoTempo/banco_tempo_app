import 'package:flutter/material.dart';

import '../../../core/models/user_model.dart';

class DrawerHeaderGeral extends StatelessWidget {
  final UserModel userModel;

  const DrawerHeaderGeral({Key key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.account_circle_outlined,
              size: 35.0,
            ), //CircleAvatar
          ), //Align
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              userModel.nome,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ), //Text
          ), //Align
          Align(
            alignment: Alignment.centerRight + Alignment(0, .3),
            child: Text(
              'Horas acumuladas: ${userModel.horas}',
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
