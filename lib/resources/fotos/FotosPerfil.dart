import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFotos{
  Future salvarimagem (File _imagem, String endereco) async {
      Reference ref = FirebaseStorage.instance.ref().child(endereco);
      await ref.putFile(_imagem);
    }

  Future pegarFoto(bool galeria, String endereco, String fotoAtual) async {
    Reference ref = FirebaseStorage.instance.ref().child(endereco);
    ImagePicker picker = ImagePicker();
    XFile pickedFile;
    if(galeria)pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    else pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
        await salvarimagem(File(pickedFile.path), endereco);
        String url = await ref.getDownloadURL();
        return url.toString();
    }
    return fotoAtual;
  }

  Future removerFoto(String url, String id) async {
    await FirebaseFirestore.instance.collection("users").doc(id).update({"foto": ""});
    await FirebaseStorage.instance.ref("Usuarios/$id/foto_perfil").delete();
  }
}

class FullscreenImage extends StatelessWidget {
  final String foto;
  FullscreenImage({this.foto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal:10, vertical: 50),
                    child: Image(
                      image: foto != "" ? NetworkImage(foto) : AssetImage("assets/images/profile.png"),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
              ),
              IconButton(
                onPressed: (){Navigator.pop(context);}, 
                icon: Icon(Icons.close_outlined,
                size: 40,
                color: Colors.white,)
                )
            ]
          ),
        ),
      ),
    );
  }
}