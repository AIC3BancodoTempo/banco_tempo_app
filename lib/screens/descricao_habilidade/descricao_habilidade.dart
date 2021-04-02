import 'package:banco_do_tempo_app/screens/core/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/hability_description/hability_description_bloc.dart';
import '../../core/models/produto_model.dart';
import '../core/colors.dart';
import '../core/loading.dart';
import '../core/navigation.dart';
import '../core/ui.dart';
import 'components/anunciante_text.dart';
import 'components/carousel_image.dart';
import 'components/chips.dart';
import 'components/fields.dart';
import 'components/main_description_title.dart';

class HabilityDescription extends StatelessWidget {
  final User user;
  HabilityDescription({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProdutoModel produtoModel = ModalRoute.of(context).settings.arguments;
    return BlocProvider(
      create: (context) =>
          HabilityDescriptionBloc(produtoModel: produtoModel, user: user)
            ..add(StartedEvent()),
      child: HabilityDescriptionPage(),
    );
  }
}

class HabilityDescriptionPage extends StatefulWidget {
  HabilityDescriptionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<HabilityDescriptionPage> {
  HabilityDescriptionBloc habilityDescriptionBloc;
  final GlobalKey<State> keyLoader = new GlobalKey<State>();

  @override
  void dispose() {
    habilityDescriptionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    habilityDescriptionBloc = BlocProvider.of<HabilityDescriptionBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text(
          "Serviços/Habilidades",
        ),
      ),
      body: BlocListener<HabilityDescriptionBloc, HabilityDescriptionState>(
        listener: (contextListener, state) {
          if (state is ChatPressedState) {
            navigateToChatScreen(context, state.trocaModel);
          } else if (state is WarningState) {
            buildSnackBarUi(context, state.message);
          }
        },
        child: BlocBuilder<HabilityDescriptionBloc, HabilityDescriptionState>(
            builder: (context, state) {
          if (state is ShowScreenState) {
            return ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(7),
                  child: ImageCarousel(
                      imageList: habilityDescriptionBloc.produtoModel.images),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      MainTitle(
                        title: habilityDescriptionBloc.produtoModel.productName,
                        tempo: habilityDescriptionBloc.produtoModel.custoHoras
                            .toString(),
                      ),
                      spaceVertical(20),
                      Text(
                        habilityDescriptionBloc.produtoModel.productDescritpion,
                        textAlign: TextAlign.justify,
                        style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
                      ),
                      spaceVertical(30),
                      Chips(
                        hora: habilityDescriptionBloc.produtoModel.custoHoras
                            .toString(),
                        dropList: habilityDescriptionBloc.getDrop(),
                        defaultValue: habilityDescriptionBloc.getAmount(),
                        onChanged: (value) {
                          habilityDescriptionBloc.setAmount(value);
                        },
                      ),
                      spaceVertical(30),
                      AnuncianteText(
                        text: habilityDescriptionBloc.produtoModel.userPostName,
                      ),
                      spaceVertical(20),
                      RoundedButton(
                        text: "TENHO INTERESSE",
                        onpress: () {
                          habilityDescriptionBloc.add(ChatPressedEvent());
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Loading();
          }
        }),
      ),
    );
  }
}
