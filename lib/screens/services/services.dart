import 'package:banco_do_tempo_app/blocs/services/services_bloc.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:banco_do_tempo_app/screens/core/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../core/colors.dart';
import '../core/drawer/sidebar_user.dart';
import 'components/cards.dart';

class Services extends StatelessWidget {
  final AuthBloc authBloc;

  Services({Key key, this.authBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesBloc(),
      child: ServicesPage(),
    );
  }
}

class ServicesPage extends StatelessWidget {
  ServicesBloc servicesBloc;
  @override
  Widget build(BuildContext context) {
    servicesBloc = BlocProvider.of<ServicesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text('Serviços/Habilidades'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: SideBarGeral(),
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
        backgroundColor: kPrimaryColor,
        onPressed: () {
          navigateToSkillHabilit(context);
        },
      ),
    );
  }
}
