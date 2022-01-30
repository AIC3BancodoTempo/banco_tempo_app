import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/resources/Fotos/FotosPerfil.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/models/exchange_model.dart';
import '../../core/navigation.dart';

class CardExchanges extends StatelessWidget {
  final ExchangeModel exchangeModel;
  final int tipo;

  CardExchanges({Key key, this.exchangeModel, this.tipo}) : super(key: key);

  UserModel _foto (DocumentSnapshot snapshot){
    return UserModel(
        foto: snapshot["foto"],
    );
  }

  Stream<UserModel> get _fotos{
    return FirebaseFirestore.instance.collection("users").doc(exchangeModel.userPostId).snapshots().map(_foto);
  }
  @override
  Widget build(context) {
    return StreamBuilder<UserModel>(
      stream: _fotos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final foto = snapshot.data;
          return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  navigateToChatScreen(context, exchangeModel);
                },
                leading: GestureDetector(
                  onTap: (){Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => FullscreenImage(foto:foto.foto)));},
                  child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: foto.foto != "" ? NetworkImage(foto.foto) : AssetImage("assets/images/profile.png")),
                ),
                title: Text(tipo == 0
                    ? exchangeModel.userPostName
                    : exchangeModel.userConsumerName),
                subtitle: Text(
                  exchangeModel.mensagem != null
                      ? exchangeModel.mensagem.content
                      : "Conversa não iniciada",
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              )
            ],
          ),
        );
        }
        return Loading();
      }
    );
  }
}
