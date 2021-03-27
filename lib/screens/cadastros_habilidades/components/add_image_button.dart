import 'dart:io';

import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInclude extends StatefulWidget {
  @override
  _ImageIncludeState createState() => _ImageIncludeState();
}

class _ImageIncludeState extends State<ImageInclude> {
  File _image;

  void _imgFromCamera() async {
    PickedFile pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    File file = File(pickedFile.path);
    if (file != null) {
      setState(() {
        _image = file;
      });
    }
  }

  void _imgFromGallery() async {
    PickedFile pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    File file = File(pickedFile.path);
    if (file != null) {
      setState(() {
        _image = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 120.0,
      children: <Widget>[
        new Text('Anexe uma Foto',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans',
                fontStyle: FontStyle.normal,
                fontSize: 16)),
        new FloatingActionButton(
          heroTag: "btn",
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            _showPicker(context);
          },
        ),
      ],
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
