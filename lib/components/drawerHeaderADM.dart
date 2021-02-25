import 'package:flutter/material.dart';

class DrawerHeaderADM extends StatelessWidget {
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
                          child: Text ('Adm',
                          style: TextStyle(fontSize:20.0,),
                          ),//Text
                        ),//Align
                        Align(
                          alignment: Alignment.centerRight + Alignment(0, .3),
                          child: Text('Horas acumuladas: 20:00',
                          style: TextStyle(),
                          ),
                        ),
                    ],
                  ),
                  
                );
  }
}