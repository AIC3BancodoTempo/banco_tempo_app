import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_profile.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  File imageFile;
  _openGallery(BuildContext context) async {
    var picture = ImagePicker();

    var file = await picture.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(file.path);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = ImagePicker();
    var file = await picture.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(file.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Imagem"),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Dados"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Câmera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        // imagem de fundo não consegui colocar a imagem de fundo deixei preto a imabem tá em assets/img
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ImageProfile(imageFile: imageFile),
                ],
              )
            ],
          ),
          SizedBox(height: 22),
          Text(
            'Nome do Contato',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '12.5 Horas Acumuladas',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              _showChoiceDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
