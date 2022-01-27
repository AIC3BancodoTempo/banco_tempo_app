import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/service_description/service_description_bloc.dart';
import '../../core/models/service_model.dart';
import '../core/colors.dart';
import '../core/loading.dart';
import '../core/navigation.dart';
import '../core/buttons/rounded_button.dart';
import '../core/ui.dart';
import 'components/anunciante_text.dart';
import 'components/carousel_image.dart';
import 'components/chips.dart';
import 'components/fields.dart';
import 'components/main_description_title.dart';

class ServiceDescription extends StatelessWidget {
  final User user;
  ServiceDescription({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ServiceModel serviceModel = ModalRoute.of(context).settings.arguments;
    return BlocProvider(
      create: (context) =>
          ServiceDescriptionBloc(serviceModel: serviceModel, user: user)
            ..add(StartedEvent()),
      child: ServiceDescriptionPage(),
    );
  }
}

class ServiceDescriptionPage extends StatefulWidget {
  ServiceDescriptionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<ServiceDescriptionPage> {
  ServiceDescriptionBloc serviceDescriptionBloc;
  final GlobalKey<State> keyLoader = new GlobalKey<State>();

  @override
  void dispose() {
    serviceDescriptionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    serviceDescriptionBloc = BlocProvider.of<ServiceDescriptionBloc>(context);
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
      body: BlocListener<ServiceDescriptionBloc, ServiceDescriptionState>(
        listener: (contextListener, state) {
          if (state is ChatPressedState) {
            navigateToChatScreen(context, state.exchangeModel);
          } else if (state is WarningState) {
            buildSnackBarUi(context, state.message);
          }
        },
        child: BlocBuilder<ServiceDescriptionBloc, ServiceDescriptionState>(
            builder: (context, state) {
          if (state is ShowScreenState) {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(7),
                  child: serviceDescriptionBloc.serviceModel.images.isNotEmpty
                      ? ImageCarousel(
                          imageList: serviceDescriptionBloc.serviceModel.images)
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Container(
                            height: 300,
                            width: 200,
                            child: ClipRRect(
                              child: Image(
                                  image:
                                      AssetImage('assets/images/noimage.jpg')),
                            ),
                          ),
                        ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MainTitle(
                        title: serviceDescriptionBloc.serviceModel.productName,
                        tempo: serviceDescriptionBloc.serviceModel.custoHoras
                            .toString(),
                      ),
                      spaceVertical(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Text(
                          serviceDescriptionBloc
                              .serviceModel.productDescription,
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(height: 1.5, color: Color(0xFF6F8398)),
                        ),
                      ),
                      spaceVertical(30),
                      Chips(
                        hora: serviceDescriptionBloc.serviceModel.custoHoras
                            .toString(),
                        dropList: serviceDescriptionBloc.getDrop(),
                        defaultValue: serviceDescriptionBloc.getAmount(),
                        onChanged: (value) {
                          serviceDescriptionBloc.setAmount(value);
                        },
                      ),
                      spaceVertical(30),
                      AnuncianteText(
                          isSolicitante:
                              serviceDescriptionBloc.serviceModel.isSearch,
                          textAnunciante:
                              serviceDescriptionBloc.serviceModel.userPostName,
                          textTipo:
                              serviceDescriptionBloc.serviceModel.typeProduct,
                          isEvento:
                              serviceDescriptionBloc.serviceModel.isEvent),
                      spaceVertical(20),
                      if (serviceDescriptionBloc.user.uid !=
                          serviceDescriptionBloc.serviceModel.userPostId)
                        RoundedButton(
                          text: serviceDescriptionBloc.serviceModel.isSearch
                              ? "OFERECER"
                              : "TENHO INTERESSE",
                          onpress: () {
                            serviceDescriptionBloc.add(ChatPressedEvent());
                          },
                        ),
                      if (serviceDescriptionBloc.user.uid !=
                          serviceDescriptionBloc.serviceModel.userPostId)
                        RoundedButton(
                          text: "INTERESSE DO BANCO",
                          onpress: () {
                            serviceDescriptionBloc.add(ChatPressedEvent());
                          },
                        )
                      else
                        Container()
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
