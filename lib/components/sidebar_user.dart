import 'package:banco_do_tempo_app/components/drawerHeaderUSER.dart';
import 'package:flutter/material.dart';

class SideBarUser extends StatelessWidget {

final draweruser = Drawer (
            child: ListView(
              children: <Widget>[
                DrawerHeaderUSER(),//DrawerHeader
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
       return draweruser;
  }
}