import 'package:banco_do_tempo_app/screens/core/navigation.dart';
import 'package:flutter/material.dart';

import 'drawerHeaderGeral.dart';

class SideBarAdm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeaderGeral(), //DrawerHeader

          ListTile(
            trailing: Icon(Icons.add_rounded),
            title: Text("Divulgações pendentes"),
            onTap: () {
              navigateToPendingPosts(context);
            },
          ),

          ListTile(
            trailing: Icon(Icons.article_outlined),
            title: Text("Meus cadastros", style: TextStyle()),
            onTap: () {
              navigateToMyPosts(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.autorenew),
            title: Text("Trocas em andamento"),
            onTap: () {
              navigateToCurrentExchanges(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.account_circle_outlined),
            title: Text("Meu perfil"),
            onTap: () {
              navigateToProfileScreen(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.notifications_none),
            title: Text("Perguntas Frequentes"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
