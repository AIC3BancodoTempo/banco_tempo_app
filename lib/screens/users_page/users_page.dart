

import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/user_card.dart';




class TelaUsuarios extends StatefulWidget {


  TelaUsuarios({ Key key }) : super(key: key);

  @override
  State<TelaUsuarios> createState() => _TelaUsuariosState();
}

class _TelaUsuariosState extends State<TelaUsuarios> {
  var filtro_atual = 0;
  var ordenar_atual = "Alfabético";
  var pos_user = [];
  var users = [];

  func_filtro(valor){
    if (valor == 0) return "Mostrar todos";
    else return "$valor horas ou mais";
  }


  Stream<QuerySnapshot<Map<String, dynamic>>> asd = FirebaseFirestore.instance.collection("users").snapshots();

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
        pos_user = [];
        users = [];
        
        if(streamSnapshot.data == null) return CircularProgressIndicator();
        QuerySnapshot snap = streamSnapshot.data;
        List<DocumentSnapshot> documents = snap.docs;
        for (var i = 0; i < streamSnapshot.data.docs.length; i++) {
          if (streamSnapshot.data.docs[i]["horas"] >= filtro_atual) {
            pos_user.add({"nome": streamSnapshot.data.docs[i]["nome"],"horas":streamSnapshot.data.docs[i]["horas"],"id":documents[i].id});
            //pos_user.add(i);
          }
        }
    
        if (ordenar_atual == "Alfabético") {
          pos_user.sort((a,b){
            var as = a["nome"];
            var bs = b["nome"];
            return as.toString().toLowerCase().compareTo(bs.toString().toLowerCase());
          });
        }
        if (ordenar_atual == "Alfabético inversa") {
          pos_user.sort((a,b){
            var as = a["nome"];
            var bs = b["nome"];
            return -as.toString().toLowerCase().compareTo(bs.toString().toLowerCase());
          });
        }
        if (ordenar_atual == "Horas crescente") {
          pos_user.sort((a,b){
            var as = a["horas"];
            var bs = b["horas"];
            return as.toString().compareTo(bs.toString());
          });
        }
        if (ordenar_atual == "Horas decrescente") {
          pos_user.sort((a,b){
            var as = a["horas"];
            var bs = b["horas"];
            return -as.toString().compareTo(bs.toString());
          });
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.filter_alt_rounded,size: 25,color: Colors.grey[300],)),
                          TextSpan( text: "Filtrar",
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],fontWeight: FontWeight.w600))
                        ]
                      )
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.sort,size: 25,color: Colors.grey[300],)),
                          TextSpan( text: "Ordenar",
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],fontWeight: FontWeight.w600))
                        ]
                      )
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 35,
                      child:  DropdownButton(
                        value: filtro_atual,
                        onChanged: (e) {
                          setState(() {
                          filtro_atual = e;
                          });
                        },
                        items: [0,1,2,3,4,5,6,7,8,9].map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              "${func_filtro(e)}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ),
                  Container(
                    height: 35,
                    child: DropdownButton(
                      value: ordenar_atual,
                      onChanged: (e) {
                        setState(() {
                        ordenar_atual = e;
                        });
                      },
                      items: ["Alfabético","Alfabético inversa", "Horas crescente", "Horas decrescente"].map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            "${e}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              
                            )
                          ),
                        );
                      }).toList(),
                    )
                  ),
                ],
              ),
              
              Expanded(
                flex: 1,
                child: pos_user.length > 0 
                ? ListView.builder(
                    itemCount: pos_user.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = documents[index];
                      return Column(
                        children: [
                          UserCard(nome: pos_user[index]["nome"], horas: pos_user[index]["horas"], id: pos_user[index]["id"],),
                          Divider(height: 10)
                        ],
                      );
                  })
                : Center(child: Text(
                  "Nenhum usuario foi encontrado",
                  style: TextStyle(
                    fontSize: 20,
                    color: themeColor
                  ),
                  ))
                )
              ],
            ),
          );
        }

      )
    );
  }
}
