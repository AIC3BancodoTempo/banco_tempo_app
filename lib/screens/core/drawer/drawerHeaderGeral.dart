import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:flutter/material.dart';

class DrawerHeaderGeral extends StatelessWidget {
  final UserModel userModel;

  const DrawerHeaderGeral({Key key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: 
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 35.0,
                        ),//CircleAvatar
                        ),//Align
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text (userModel.nome,
                          style: TextStyle(fontSize:20.0,),
                          ),//Text
                        ),//Align
                        Align(
                          alignment: Alignment.centerRight + Alignment(0, .3),
                          child: Text('Horas acumuladas: ${userModel.horas}',
                          style: TextStyle(),
                          ),
                        ),
                    ],
                  ),
                  
                );
  }
}