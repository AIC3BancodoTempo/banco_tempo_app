import 'dart:async';

import 'package:banco_do_tempo_app/blocs/add_services/add_service_bloc.dart';
import 'package:banco_do_tempo_app/core/models/produto_model.dart';
import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/core/validations.dart';
import 'package:banco_do_tempo_app/screens/core/error.dart';
import 'package:banco_do_tempo_app/screens/core/form/dropdown.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:banco_do_tempo_app/screens/core/success.dart';
import 'package:banco_do_tempo_app/screens/register_questionary/components/questions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/colors.dart';
import '../core/rounded_button.dart';
import 'components/insert_input_texts.dart';
import 'components/title_add_text.dart';

class AddAbility extends StatelessWidget {
  final UserModel user;

  const AddAbility({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddServiceBloc(
        user: user,
      )..add(AddServiceStartedEvent()),
      child: AddAbilityPage(),
    );
  }
}

class AddAbilityPage extends StatefulWidget {
  @override
  _AddAbilityPageState createState() => _AddAbilityPageState();
}

class _AddAbilityPageState extends State<AddAbilityPage> {
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

  @override
  void dispose() {
    addServiceBloc.add(DisposeEvent());
    addServiceBloc.close();
    super.dispose();
  }

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
          "Descrição",
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
                          addServiceBloc.setName(value);
                        },
                      ),
                      InsertInputs(
                        insertLabel: 'Descrição',
                        onChanged: (value) {
                          addServiceBloc.setDescription(value);
                        },
                      ),
                      InsertInputs(
                        keyboardType: TextInputType.number,
                        insertLabel: 'Quantidade Disponível',
                        onChanged: (value) {
                          addServiceBloc.setQuantity(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
                        child: FormDropDown(
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
                          hint: "Quantia em Horas",
                          onChanged: (value) {
                            addServiceBloc.setCustoHoras(value);
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
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
