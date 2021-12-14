

import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/user_card.dart';




class TelaUsuarios extends StatelessWidget {


  TelaUsuarios({ Key key }) : super(key: key);

  ////CollectionReference<Map<String, dynamic>> docRef = FirebaseFirestore.instance.collection('users');

  /*Future<QuerySnapshot<Map<String, dynamic>>> result = FirebaseFirestore.instance.collection('users').get();
  List<DocumentSnapshot> documents = result.doc;*/


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
        title: Text('Usuarios'),
        actions: <Widget>[
          Icon(Icons.search),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
        if(streamSnapshot.data == null) return CircularProgressIndicator();
        QuerySnapshot snap = streamSnapshot.data;
        List<DocumentSnapshot> documents = snap.docs;
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        icon: Icon(Icons.filter_alt_rounded,size: 25,color: Colors.grey[300],),
                        label: Text(
                          "Filtrar",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600]
                          ),
                        ), 
                        onPressed: () {print(streamSnapshot.data.docs[0]["nome"]);},
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.sort,size: 25,color: Colors.grey[300],),
                      label: Text(
                        "Ordenar",
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600]
                        )
                      ), 
                      onPressed: () {print(documents);},
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: streamSnapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = documents[index];
                    return Column(
                      children: [
                        UserCard(nome: streamSnapshot.data.docs[index]["nome"], horas: streamSnapshot.data.docs[index]["horas"], id: doc.id,),
                        Divider(height: 10)
                      ],
                    );
                  })
                )
              ],
            ),
          );
        }

      )
    );
  }
}
