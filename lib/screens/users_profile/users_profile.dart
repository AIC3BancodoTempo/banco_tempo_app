import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_hours.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_produtotalento.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/card_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {

  final String nome;
  final int horas;
  final String id;

  const UserProfile({ Key key, this.nome, this.horas, this.id }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  int cont = 0;
  List<String> produtos = [];
  List<int> pos = [];

  @override
  // ignore: must_call_super
  void initState() {
    cont = 0;
    produtos = [];
    pos = [];
  }
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("produto").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
        if(streamSnapshot.data == null) return CircularProgressIndicator();
        QuerySnapshot snap = streamSnapshot.data;
        List<DocumentSnapshot> documents = snap.docs;

        for (var i = 0; i < streamSnapshot.data.docs.length; i++) {
          if (streamSnapshot.data.docs[i]["userPostId"] == widget.id){
            produtos.add(streamSnapshot.data.docs[i]["userPostId"]);
            pos.add(i);
          }
        }
        print((5/2).round());
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardProfile(nome: widget.nome,),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text("Horas disponíveis",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
          ),
          CardHours(horas: widget.horas,),
           Padding(
            padding: const EdgeInsets.all(18),
            child: Text("Produtos/Talentos",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
          ),
          Expanded(
             child: ListView.builder(
                  itemCount: (pos.length/2).toInt(),
                  itemBuilder: (context, index) {
                    return   Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          CardProdutoTalento(
                            imagem: streamSnapshot.data.docs[pos[index*2]]["imagens"],
                            nome: streamSnapshot.data.docs[pos[index*2]]["productName"],
                            quantidade: streamSnapshot.data.docs[pos[index*2]]["productQuantity"],
                            horas: streamSnapshot.data.docs[pos[index*2]]["custoHoras"],
                            ),
                          CardProdutoTalento(
                            imagem: streamSnapshot.data.docs[pos[index*2+1]]["imagens"],
                            nome: streamSnapshot.data.docs[pos[index*2+1]]["productName"],
                            quantidade: streamSnapshot.data.docs[pos[index*2+1]]["productQuantity"],
                            horas: streamSnapshot.data.docs[pos[index*2+1]]["custoHoras"],
                            )
                        ],
                      ));
                    // ignore: dead_code
                   
                  }
                  )
                  )



                    /*if (streamSnapshot.data.docs[index]["userPostId"] == widget.id){
                      return Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardProdutoTalento(
                            imagem: streamSnapshot.data.docs[index]["imagens"],
                            nome: streamSnapshot.data.docs[index]["productName"],
                            quantidade: streamSnapshot.data.docs[index]["productQuantity"],
                            horas: streamSnapshot.data.docs[index]["custoHoras"],
                            ),
                          CardProdutoTalento(
                            imagem: streamSnapshot.data.docs[index]["imagens"],
                            nome: streamSnapshot.data.docs[index]["productName"],
                            quantidade: streamSnapshot.data.docs[index]["productQuantity"],
                            horas: streamSnapshot.data.docs[index]["custoHoras"],
                          )
                        ],
                      ),
                    );
                    }
                    else return null;
                  }*/
                    
            /*child: ListView(
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
            )*/
                  
        ],
      );
      }
    ));
  }
}