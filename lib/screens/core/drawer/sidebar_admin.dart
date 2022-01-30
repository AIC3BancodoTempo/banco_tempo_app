import 'package:flutter/material.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../about_dialog.dart';
import '../navigation.dart';
import 'drawer_header_geral.dart';

class SideBarAdm extends StatelessWidget {
  final AuthBloc authBloc;

  const SideBarAdm({Key key, this.authBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeaderGeral(userModel: authBloc.userModel), //DrawerHeader

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
            trailing: Icon(Icons.info_outlined),
            title: Text("Sobre"),
            onTap: () {
              showCustomAboutDialog(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.logout),
            title: Text("Sair"),
            onTap: () {
              authBloc.add(LogoutEvent());
            },
          ),
          SizedBox(height: 50,),
          Divider(height: 2,thickness: 2,),
          ListTile(
            title: Text("Administrador:"),
          ),
          ListTile(
            trailing: Icon(Icons.person_outline_rounded),
            title: Text("Usuarios"),
            onTap: () {
              navigateToUsersPage(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.history),
            title: Text("Historico de mudanças de horas"),
            onTap: () {
              navigateToLogHours(context);
            },
          ),
          
        ],
      ),
    );
  }
}
