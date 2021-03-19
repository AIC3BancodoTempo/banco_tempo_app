import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/material.dart';

import '../core/main_button.dart';
import 'components/add_image_button.dart';
import 'components/insert_input_texts.dart';
import 'components/title_add_text.dart';

class AddAbilityPage extends StatefulWidget {
  @override
  AddAbilityPageState createState() {
    return AddAbilityPageState();
  }
}

class AddAbilityPageState extends State<AddAbilityPage> {
  List<UploadJob> _profilePictures = [];
  final _formKey = GlobalKey<FormState>();
  final myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFA95EFA),
        title: Text(
          "Descrição",
        ),
      ),
      body: new SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TitleAddText(
                insertTitleHere:
                    'Adicione uma habilidade, serviço ou o que está procurando.',
              ),
              InsertInputs(
                insertLabel: 'Nome',
                onChanged: null,
              ),
              InsertInputs(
                insertLabel: 'Quantia em Horas',
                onChanged: null,
              ),
              InsertInputs(
                insertLabel: 'Descrição',
                onChanged: null,
              ),
              InsertInputs(
                insertLabel: 'Quantidade Disponível',
                onChanged: null,
              ),
              SizedBox(height: 50.0),
              ImageInclude(),
              SizedBox(height: 30.0),
              ButtonDescriptionAndAdd(
                iconData: Icons.login_rounded,
                onpress: () {},
                text: "CADASTRAR",
              ),
              SizedBox(height: 30.0),
              PictureUploadWidget(
                onPicturesChange: profilePictureCallback,
                initialImages: _profilePictures,
                settings:
                    PictureUploadSettings(onErrorFunction: onErrorCallback),
                buttonStyle: PictureUploadButtonStyle(),
                buttonText: 'Upload Picture',
                enabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onErrorCallback(error, stackTrace) {
    print(error);
    print(stackTrace);
  }

  void profilePictureCallback(
      {List<UploadJob> uploadJobs, bool pictureUploadProcessing}) {
    _profilePictures = uploadJobs;
  }
}
