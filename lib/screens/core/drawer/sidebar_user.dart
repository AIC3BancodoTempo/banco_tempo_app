import 'package:flutter/material.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../navigation.dart';
import 'drawer_header_geral.dart';

class SideBarGeral extends StatelessWidget {
  final AuthBloc authBloc;

  const SideBarGeral({Key key, this.authBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeaderGeral(userModel: authBloc.userModel), //DrawerHeader
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
            onTap: () {
              authBloc.add(LogoutEvent());
            },
          ),
        ],
      ),
    );
  }
}
