import 'package:banco_do_tempo_app/resources/fotos/FotosPerfil.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/models/user_model.dart';
import '../../../core/models/bank_model.dart';

// ignore: must_be_immutable
class DrawerHeaderGeral extends StatefulWidget {
  final UserModel userModel;

  DrawerHeaderGeral({Key key, this.userModel}) : super(key: key);

  @override
  State<DrawerHeaderGeral> createState() => _DrawerHeaderGeralState();
}

class _DrawerHeaderGeralState extends State<DrawerHeaderGeral> {
  final BankModel bankModel = BankModel();

  

  AddFotos add = AddFotos();

  UserModel _usuario(DocumentSnapshot snapshot) {
    
    return UserModel(
        key: snapshot.id,
        nome: snapshot['nome'] ?? "",
        horas: snapshot['horas'].toDouble() ?? 0,
        foto: snapshot["foto"]);
  }

  Stream<UserModel> get _user {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userModel.key)
        .snapshots()
        .map(_usuario);
  }
  double horas = 0.0;
  @override
  Widget build(BuildContext context) {
    Future<BankModel> readinfo() async {
      BankModel model;
      try {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('bank')
            .doc('info')
            .get();
        if (snapshot.exists) {
          model = BankModel.fromSnapshot(snapshot.data());
          horas = model.horas;
        }
      } catch (error) {
        throw error;
      }
      return model;
    }

    readinfo();

    return StreamBuilder<UserModel>(
        stream: _user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final usuario = snapshot.data;
            return UserAccountsDrawerHeader(
              accountName: Text(
                usuario.nome,
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text('Horas acumuladas: ${usuario.horas}\n' +
                  'Horas do banco: $horas'),
              currentAccountPicture: Stack(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        barrierDismissible: true,
                        opaque: false,
                        pageBuilder: (_, __, ___) =>
                            FullscreenImage(foto: usuario.foto)));
                  },
                  child: CircleAvatar(
                    backgroundImage: usuario.foto != ""
                        ? NetworkImage(usuario.foto)
                        : AssetImage('assets/images/profile.png'),
                    radius: 90,
                  ),
                ),
                Positioned(
                  top: -12,
                  left: -12,
                  child: IconButton(
                      onPressed: () async {
                        String foto = await add.pegarFoto(
                            true,
                            "Usuarios/${usuario.key}/foto_perfil",
                            usuario.foto);

                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(usuario.key)
                            .update({"foto": foto});
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: white,
                        size: 25,
                      )),
                ),
                usuario.foto != ""
                    ? Positioned(
                        top: -12,
                        right: -12,
                        child: IconButton(
                            onPressed: () async {
                              await add.removerFoto(usuario.foto, usuario.key);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: white,
                              size: 25,
                            )),
                      )
                    : SizedBox.shrink()
              ]),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: new DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  )),
            );
          }
          return Loading();
        });
  }
}
