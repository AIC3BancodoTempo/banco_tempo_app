


import 'package:banco_do_tempo_app/blocs/service/service_bloc.dart';
import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'components/user_card.dart';




class TelaUsuarios extends StatefulWidget {
  const TelaUsuarios({ Key key }) : super(key: key);

  @override
  _TelaUsuariosState createState() => _TelaUsuariosState();
}

class _TelaUsuariosState extends State<TelaUsuarios> {

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
        title: Text('Usuarios'),
        actions: <Widget>[
          Icon(Icons.search),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
        if(streamSnapshot.data == null) return CircularProgressIndicator();
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: streamSnapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return UserCard(nome: streamSnapshot.data.docs[index]["nome"], horas: streamSnapshot.data.docs[index]["horas"]);
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