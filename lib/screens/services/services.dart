import 'package:banco_do_tempo_app/blocs/hability/hability_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
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
      create: (context) => HabilityBloc()..add(HabilityStartedEvent()),
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
  HabilityBloc habilityBloc;

  @override
  void dispose() {
    habilityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    habilityBloc = BlocProvider.of<HabilityBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: const Text('Serviços/Habilidades'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: widget.authBloc.userModel.isAdmin
          ? SideBarAdm(authBloc: widget.authBloc)
          : SideBarGeral(authBloc: widget.authBloc),
      body: BlocListener<HabilityBloc, HabilityState>(
        listener: (contextListener, state) {},
        child:
            BlocBuilder<HabilityBloc, HabilityState>(builder: (context, state) {
          if (state is LoadingHabilityState) {
            return Loading();
          } else {
            return Cards(
              mockupPosts: habilityBloc.habilityList,
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: themeColor,
        onPressed: () {
          navigateToSkillHabilit(context);
        },
      ),
    );
  }
}
