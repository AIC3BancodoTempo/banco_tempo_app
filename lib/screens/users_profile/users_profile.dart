import 'package:banco_do_tempo_app/blocs/service/service_bloc.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/services/components/cards.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_hours.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_produtotalento.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_profile.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {

  final String nome;
  final int horas;

  const UserProfile({ Key key, this.nome, this.horas }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  ServiceBloc serviceBloc;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text("Perfil do usuario"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardProfile(),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text("Horas disponíveis",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
          ),
          CardHours(),
           Padding(
            padding: const EdgeInsets.all(18),
            child: Text("Produtos/Talentos",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardProdutoTalento(),
                      CardProdutoTalento()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardProdutoTalento(),
                      CardProdutoTalento()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardProdutoTalento(),
                      CardProdutoTalento()
                    ],
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}