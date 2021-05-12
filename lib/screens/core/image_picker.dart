import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showImagePicker(BuildContext context, Function function) {
  final picker = ImagePicker();
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: [
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Galeria'),
                    onTap: () async {
                      PickedFile pickedFile =
                          await picker.getImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        File _image = File(pickedFile.path);
                        function(_image);
                      }
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Câmera'),
                  onTap: () async {
                    PickedFile pickedFile =
                        await picker.getImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      File _image = File(pickedFile.path);
                      function(_image);
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
