import '../core/loading.dart';

import '../../blocs/exchange_in_progress/exchange_in_progress_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/card_exchange_in_progress.dart';

class ExchangeInProgress extends StatelessWidget {
  final User user;

  const ExchangeInProgress({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExchangeInProgressBloc(user: user)
        ..add(ExchangeInProgressStartedEvent()),
      child: ExchangeInProgressPage(),
    );
  }
}

class ExchangeInProgressPage extends StatefulWidget {
  @override
  _ExchangeInProgress createState() => _ExchangeInProgress();
}

class _ExchangeInProgress extends State<ExchangeInProgressPage> {
  ExchangeInProgressBloc exchangeInProgressBloc;
  final ScrollController listPostScrollController = ScrollController();
  final ScrollController listConsumeScrollController = ScrollController();

  @override
  void dispose() {
    exchangeInProgressBloc.close();
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
      exchangeInProgressBloc.add(GetMoreConsumerExchangesEvent());
    }
  }

  void _scrollListenerPost() {
    if (listPostScrollController.offset >=
            listPostScrollController.position.minScrollExtent &&
        !listPostScrollController.position.outOfRange) {
      exchangeInProgressBloc.add(GetMorePostExchangesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    exchangeInProgressBloc = BlocProvider.of<ExchangeInProgressBloc>(context);
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
              Tab(text: 'Meus cadastros'),
              Tab(text: 'Meus interesses'),
            ],
          ),
          title: Text("Trocas em andamento"),
          centerTitle: true,
        ),
        body: BlocBuilder<ExchangeInProgressBloc, ExchangeInProgressState>(
            builder: (context, state) {
          if (state is LoadingExchangesState) {
            return TabBarView(children: [Loading(), Loading()]);
          } else {
            return TabBarView(children: [
              ListView.builder(
                  controller: listPostScrollController,
                  itemCount: exchangeInProgressBloc.exchangesPostList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardExchanges(
                      exchangeModel:
                          exchangeInProgressBloc.exchangesPostList[index],
                      tipo: 1,
                    );
                  }),
              ListView.builder(
                  controller: listConsumeScrollController,
                  itemCount:
                      exchangeInProgressBloc.exchangesConsumerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardExchanges(
                      exchangeModel:
                          exchangeInProgressBloc.exchangesConsumerList[index],
                      tipo: 0,
                    );
                  }),
            ]);
          }
        }),
      ),
    );
  }
}
