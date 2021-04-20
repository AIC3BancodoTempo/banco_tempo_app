import '../core/loading.dart';

import '../../blocs/trocas_andamento/trocas_andamento_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/card_trocas_andamento.dart';

class TrocasAndamento extends StatelessWidget {
  final User user;

  const TrocasAndamento({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrocasAndamentoBloc(user: user)..add(TrocasAndamentoStartedEvent()),
      child: TrocasAndamentoPage(),
    );
  }
}

class TrocasAndamentoPage extends StatefulWidget {
  @override
  _TrocasAndamento createState() => _TrocasAndamento();
}

class _TrocasAndamento extends State<TrocasAndamentoPage> {
  TrocasAndamentoBloc trocasAndamentoBloc;
  final ScrollController listPostScrollController = ScrollController();
  final ScrollController listConsumeScrollController = ScrollController();

  @override
  void dispose() {
    trocasAndamentoBloc.close();
    listPostScrollController.dispose();
    listConsumeScrollController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    listPostScrollController.addListener(_scrollListenerPost);
    listConsumeScrollController.addListener(_scrollListenerConsumer);
  }

  void _scrollListenerConsumer() {
    if (listConsumeScrollController.offset >=
            listConsumeScrollController.position.minScrollExtent &&
        !listConsumeScrollController.position.outOfRange) {
      trocasAndamentoBloc.add(GetMoreConsumerTrocasEvent());
    }
  }

  void _scrollListenerPost() {
    if (listPostScrollController.offset >=
            listPostScrollController.position.minScrollExtent &&
        !listPostScrollController.position.outOfRange) {
      trocasAndamentoBloc.add(GetMorePostTrocasEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    trocasAndamentoBloc = BlocProvider.of<TrocasAndamentoBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Oferta'),
              Tab(text: 'Consumo'),
            ],
          ),
          title: Text("Trocas em andamento"),
          centerTitle: true,
        ),
        body: BlocBuilder<TrocasAndamentoBloc, TrocasAndamentoState>(
            builder: (context, state) {
          if (state is LoadingTrocasState) {
            return TabBarView(children: [Loading(), Loading()]);
          } else {
            return TabBarView(children: [
              ListView.builder(
                  controller: listPostScrollController,
                  itemCount: trocasAndamentoBloc.trocasPostList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardTrocas(
                      trocaModel: trocasAndamentoBloc.trocasPostList[index],
                    );
                  }),
              ListView.builder(
                  controller: listConsumeScrollController,
                  itemCount: trocasAndamentoBloc.trocasConsumerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardTrocas(
                      trocaModel: trocasAndamentoBloc.trocasConsumerList[index],
                    );
                  }),
            ]);
          }
        }),
      ),
    );
  }
}
