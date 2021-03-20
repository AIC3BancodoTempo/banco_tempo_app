import 'package:flutter/material.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../core/colors.dart';
import '../core/drawer/sidebar_user.dart';
import 'components/cards.dart';

class Services extends StatelessWidget {
  final AuthBloc authBloc;

  Services({Key key, this.authBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: const Text('Serviços/Habilidades'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: SideBarGeral(),
      body: Stack(
        children: [Cards()],
      ),
    );
  }
}
