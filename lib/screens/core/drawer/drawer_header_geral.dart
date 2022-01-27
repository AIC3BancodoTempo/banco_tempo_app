import 'package:banco_do_tempo_app/resources/fotos/FotosPerfil.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/models/user_model.dart';
import '../../../core/models/bank_model.dart';

// ignore: must_be_immutable
class DrawerHeaderGeral extends StatelessWidget {
  final UserModel userModel;
  final BankModel bankModel = BankModel();

  DrawerHeaderGeral({Key key, this.userModel}) : super(key: key);

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
        .doc(userModel.key)
        .snapshots()
        .map(_usuario);
  }

  @override
  Widget build(BuildContext context) {
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
                  'Horas do banco: ${bankModel.horas}'),
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
