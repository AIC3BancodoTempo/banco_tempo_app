import 'package:banco_do_tempo_app/components/drawerHeaderGeral.dart';
import 'package:flutter/material.dart';

class SideBarGeral extends StatelessWidget {

final draweruser = Drawer (
            child: ListView(
              children: <Widget>[
                DrawerHeaderGeral(),//DrawerHeader
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