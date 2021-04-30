import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/hability/hability_bloc.dart';
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
  bool isSearch = false;
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
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
        title: !isSearch
            ? Text('Serviços/Habilidades')
            : TextField(
                onChanged: (value) {
                  habilityBloc.add(SearchHabilityEvent(search: value));
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Procurar",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: [
          isSearch
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearch = false;
                    });
                    habilityBloc.add(NewHabilityEvent());
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearch = true;
                    });
                  },
                )
        ],
      ),
      drawer: widget.authBloc.userModel.isAdmin
          ? SideBarAdm(authBloc: widget.authBloc)
          : SideBarGeral(authBloc: widget.authBloc),
      body: BlocBuilder<HabilityBloc, HabilityState>(builder: (context, state) {
        if (state is LoadingHabilityState) {
          //LOADING
          return Loading();
        } else if (state is ShowHabilityState) {
          return Cards(
            scrollController: controller,
            mockupPosts: state.habilityList,
          );
        } else {
          return Container();
        }
      }),
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
