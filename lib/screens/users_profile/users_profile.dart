
import 'package:banco_do_tempo_app/core/models/service_model.dart';
import 'package:banco_do_tempo_app/core/models/userService_model.dart';
import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_hours.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_produtotalento.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {

  final UserModel user;
  ///final String nome;
  ///final int horas;
  ///final String id;

  const UserProfile({ Key key, this.user }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

   List<UserService> _listaProdutos (QuerySnapshot snapshot){
          return snapshot.docs.map((e) {
            return UserService(
              userId: e.get("userPostId"),
              imagem: e.get("imagens"),
              nome: e.get("productName"),
              quantidade: e.get("productQuantity"),
              horas: e.get("custoHoras")
            );
          }).toList();
        }

  Stream<List<UserService>> get _produtos{
    return FirebaseFirestore.instance.collection("produto").where("userPostId", isEqualTo: widget.user.key).snapshots().map(_listaProdutos);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text("Perfil do usuario"),
      ),
      body: StreamBuilder<List<UserService>>(
        stream: _produtos,
        builder: (context, snapshot){
          print(snapshot.error);
          if (snapshot.hasData) {
            final services = snapshot.data?.toList();
            
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardProfile(nome: widget.user.nome,foto: widget.user.foto),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text("Horas disponíveis",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
                ),
                CardHours(id: widget.user.key,),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text("Produtos/Talentos",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: (services.length/2).round(),
                    itemBuilder: (context, index) {
                      print((services.length/2).round());
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            CardProdutoTalento(
                              service: services[index*2],
                              ),
                            index*2+1 < (services.length) 
                            ? CardProdutoTalento(
                              service: services[index*2+1],
                              )
                            : Container()
                          ],
                        )
                      );
                    }
                  )
                )
              ]
            );
          }
          else return Loading();
        }
      )
    );
  }
}