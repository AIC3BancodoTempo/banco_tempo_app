import 'package:banco_do_tempo_app/blocs/hability/hability_bloc.dart';
import 'package:banco_do_tempo_app/core/models/produto_model.dart';
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
  bool isSearching = false;
  HabilityBloc habilityBloc;
  final ScrollController controller = ScrollController();
  List<ProdutoModel> filteredProducts;

  @override
  void dispose() {
    controller.dispose();
    habilityBloc.close();
    super.dispose();
  }

  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    filteredProducts.addAll(habilityBloc.habilityList);
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      habilityBloc.add(GetMoreProductsEvent());
    }
  }

  void _filteredProducts(value) {
    setState(() {
      filteredProducts = filteredProducts.where((habil) =>
          habil.productName.toLowerCase().contains(value.toLowerCase()));
    });
  }

  @override
  Widget build(BuildContext context) {
    habilityBloc = BlocProvider.of<HabilityBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: !isSearching
            ? Text('Serviços/Habilidades')
            : TextField(
                onChanged: (value) {
                  _filteredProducts(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Pesquisar",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredProducts;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  })
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
              scrollController: controller,
              mockupPosts: filteredProducts,
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
