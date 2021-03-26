import 'package:flutter/material.dart';

import '../navigation.dart';
import 'drawerHeaderGeral.dart';

class SideBarGeral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeaderGeral(), //DrawerHeader
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
            trailing: Icon(Icons.logout),
            title: Text("Sair"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
