import 'dart:async';

import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/add_services/add_service_bloc.dart';
import '../../core/models/user_model.dart';
import '../../core/validations.dart';
import '../core/buttons/rounded_button.dart';
import '../core/colors.dart';
import '../core/error.dart';
import '../core/form/dropdown_underline.dart';
import '../core/loading.dart';
import '../core/success.dart';
import 'components/insert_input_texts.dart';
import 'components/offer_type.dart';
import 'components/title_add_text.dart';

class AddServiceScreen extends StatelessWidget {
  final UserModel user;

  AddServiceScreen({Key key, this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddServiceBloc(
        user: user,
      )..add(AddServiceStartedEvent()),
      child: AddServicePage(),
    );
  }
}

class AddServicePage extends StatefulWidget {
  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  AddServiceBloc addServiceBloc;
  final myFocusNode = new FocusNode();
  final GlobalKey<FormState> formInfo = GlobalKey<FormState>();
  final List<double> opcoes = [
    0.5,
    1,
    1.5,
    2,
    2.5,
    3,
    3.5,
    4,
    4.5,
    5,
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10
  ];
  final List<String> oferece = ["Produto", "Serviço", "Evento"];

  @override
  void dispose() {
    addServiceBloc.add(DisposeEvent());
    addServiceBloc.close();
    super.dispose();
  }

  bool teste = false;

  @override

  Widget build(BuildContext context) {
    addServiceBloc = BlocProvider.of<AddServiceBloc>(context);

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
          "Cadastrar",
        ),
      ),
      body: BlocListener<AddServiceBloc, AddServiceState>(
        listener: (contextListener, state) {
          if (state is SuccessState) {
            Timer(const Duration(seconds: 3), () {
              Navigator.of(context).pop();
            });
          } else if (state is FailState) {
            Timer(const Duration(seconds: 3), () {
              addServiceBloc.add(RestartEvent());
            });
          }
        },
        child: BlocBuilder<AddServiceBloc, AddServiceState>(
          builder: (context, state) {
            if (state is LoadingAddServiceState) {
              return Loading();
            } else if (state is SuccessState) {
              return SuccessScreen();
            } else if (state is FailState) {
              return ErrorScreen(
                message: state.message,
              );
            } else {
              return SingleChildScrollView(
                child: Form(
                  key: formInfo,
                  child: Column(
                    children: [
                      TitleAddText(),
                      InsertInputs(
                        insertLabel: 'Nome',
                        onChanged: (value) {
                          if (value != null) addServiceBloc.setName(value);
                        },
                      ),
                      InsertInputs(
                        insertLabel: 'Descrição',
                        onChanged: (value) {
                          if (value != null) addServiceBloc.setDescription(value);
                        },
                      ),
                      InsertInputs(
                        keyboardType: TextInputType.number,
                        insertLabel: 'Quantidade disponível ou desejava',
                        onChanged: (value) {
                          if (value != null) addServiceBloc.setQuantity(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(33.0, 20.0, 33.0, 2.0),
                        child: FormDropDownUnderline(
                          items: opcoes
                              .map<DropdownMenuItem<String>>((double value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(
                                value.toString() + " hrs",
                              ),
                            );
                          }).toList(),
                          validator: validateEmptyField,
                          hint: "Quantia em horas que deseja receber ou pagar",
                          onChanged: (value) {
                            if (value != null) addServiceBloc.setCustoHoras(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(33.0, 20.0, 33.0, 2.0),
                        child: FormDropDownUnderline(
                          items: oferece
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(
                                value.toString(),
                              ),
                            );
                          }).toList(),
                          validator: validateEmptyField,
                          hint: "Tipo de serviço, evento ou produto",
                          onChanged: (value) {
                            if (value != null){
                              addServiceBloc.setTypeProduct(value);
                              if (value == 'Evento') {
                                addServiceBloc.setTypeEvent(true);
                              }
                              addServiceBloc.setCreateEvent(value);
                            }
                            
                          },
                        ),
                      ),
                      OfferType(
                        onChange: (value) {
                          addServiceBloc.setTipe(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
                        child: Text(
                            "Ao selecionar a imagem, aguarde o carregamento!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSans',
                                fontStyle: FontStyle.normal,
                                fontSize: 18)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PictureUploadWidget(
                        //initialImages: informativoBloc.getPictures(),
                        onPicturesChange: addServiceBloc.pictureCallback,
                        buttonStyle: PictureUploadButtonStyle(
                            backgroundColor: themeColor),
                        buttonText: 'Adicionar imagem',
                        localization: PictureUploadLocalization(),
                        settings: PictureUploadSettings(
                            uploadDirectory: "/produto/",
                            imageSource: ImageSourceExtended.askUser,
                            minImageCount: 0,
                            maxImageCount: 5,
                            imageManipulationSettings:
                                const ImageManipulationSettings(
                                    enableCropping: true, compressQuality: 75)),
                        enabled: true,
                      ),
                      SizedBox(height: 30.0),
                      RoundedButton(
                        text: "CADASTRAR",
                        onpress: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if (validateAndSave(formInfo)) {
                            if (addServiceBloc.getLimitQuantityHours()) {
                              addServiceBloc.add(SubmitButtonPressed());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Não permitido! Você irá ultrapassar seu limite de 20 horas."),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void onErrorCallback(error, stackTrace) {
    print(error);
    print(stackTrace);
  }
}
