import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/services/services_bloc.dart';
import '../core/colors.dart';
import '../core/drawer/sidebar_admin.dart';
import '../core/drawer/sidebar_user.dart';
import '../core/loading.dart';
import '../core/navigation.dart';
import 'components/cards.dart';

class Services extends StatelessWidget {
  final AuthBloc authBloc;

  Services({Key key, this.authBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesBloc(),
      child: ServicesPage(authBloc: authBloc),
    );
  }
}

class ServicesPage extends StatefulWidget {
  final AuthBloc authBloc;

  const ServicesPage({Key key, this.authBloc}) : super(key: key);
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  ServicesBloc servicesBloc;

  @override
  Widget build(BuildContext context) {
    servicesBloc = BlocProvider.of<ServicesBloc>(context);
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
      drawer: widget.authBloc.userModel.isAdmin ? SideBarAdm() : SideBarGeral(),
      body: BlocListener<ServicesBloc, ServicesState>(
        listener: (contextListener, state) {},
        child:
            BlocBuilder<ServicesBloc, ServicesState>(builder: (context, state) {
          if (state is LoadingState) {
            return Loading();
          } else {
            return Cards();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateToSkillHabilit(context);
        },
      ),
    );
  }
}
