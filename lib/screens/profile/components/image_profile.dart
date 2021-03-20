import 'dart:io';

import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  final File imageFile;

  const ImageProfile({Key key, this.imageFile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
}
