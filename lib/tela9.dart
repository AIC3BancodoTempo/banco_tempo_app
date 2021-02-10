import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Alterar Dados'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
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
  Widget _decideImageView() {
    // IMAGEM
    if (imageFile == null) {
      //se a imagem for nula
      return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
      );
    } else {
      return Container(
        child: Image.file(
          imageFile,
          width: 250,
          height: 220,
        ),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
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
                          _decideImageView(),
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
              )),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.fromLTRB(2, 20, 2, 15),
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.email, color: Colors.black),
                    title: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Nome de Usuário",
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    )),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.black),
                  title: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "E-Mail",
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.lock, color: Colors.black),
                    title: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    )),
              ],
            ),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            color: Colors.white,
            textColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            onPressed: () {},
            child: Text(
              "Atualizar".toUpperCase(),
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
