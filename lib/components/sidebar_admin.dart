import 'package:flutter/material.dart';

class SideBarAdm extends StatelessWidget {
  final draweradmin = Drawer (
            child: ListView(
              children: <Widget>[
                DrawerHeader(
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
                          child: Text ('Admin',
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
                  
                ),//DrawerHeader

                ListTile(

                  trailing: Icon(Icons.add_rounded),
                  title: Text("Divulgações pendentes"),
                  onTap: () {},
                ),
                
                ListTile(

                  trailing: Icon(Icons.article_outlined),
                  title: Text("Meus cadastros", 
                  style: TextStyle()),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.autorenew),
                  title: Text("Trocas em andamento"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.account_circle_outlined),
                  title: Text("Meu perfil"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.notifications_none),
                  title: Text("Perguntas Frequentes"),
                  onTap: () {},
                ),

              ],
            ),
      
  );

final draweruser = Drawer (
            child: ListView(
              children: <Widget>[
                DrawerHeader(
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
                          child: Text ('Usuário',
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
                  
                ),//DrawerHeader
                ListTile(

                  trailing: Icon(Icons.article_outlined),
                  title: Text("Meus cadastros", 
                  style: TextStyle()),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.autorenew),
                  title: Text("Trocas em andamento"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.account_circle_outlined),
                  title: Text("Meu perfil"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.notifications_none),
                  title: Text("Perguntas Frequentes"),
                  onTap: () {},
                ),
              ],
            ),
      
  );



  @override
  Widget build(BuildContext context) {
      return draweradmin;
  }
}