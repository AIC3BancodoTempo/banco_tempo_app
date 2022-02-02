import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'components/user_card.dart';

class TelaUsuarios extends StatefulWidget {
  TelaUsuarios({Key key}) : super(key: key);

  @override
  State<TelaUsuarios> createState() => _TelaUsuariosState();
}

class _TelaUsuariosState extends State<TelaUsuarios> {
  bool pesquisar = false;
  var filtroAtual = 0;
  var ordenarAtual = "Alfabético";
  String nome = "";

  funcFiltro(valor) {
    if (valor == 0)
      return "Mostrar todos";
    else
      return "$valor horas ou mais";
  }

  List<UserModel> _listaUser(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      print(e);
      return UserModel(
          key: e.id,
          nome: e.get('nome') ?? "",
          horas: e.get('horas').toDouble() ?? 0,
          email: e.get('email') ?? "",
          isAdmin: e.get('is_admin') ?? false,
          reports: e.get('reports') ?? 0,
          foto: e.get("foto") ?? "");
    }).toList();
  }

  Stream<List<UserModel>> get _users {
    if (!pesquisar)
      return FirebaseFirestore.instance
          .collection("users")
          .where("horas", isGreaterThanOrEqualTo: filtroAtual)
          .snapshots()
          .map(_listaUser);
    else
      return FirebaseFirestore.instance
          .collection("users")
          .where("nome", isGreaterThanOrEqualTo: nome)
          .where("nome", isLessThanOrEqualTo: nome + "z")
          .snapshots()
          .map(_listaUser);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: themeColor,
          title: !pesquisar
              ? Text('Usuarios')
              : TextField(
                  onChanged: (value) {
                    setState(() {
                      nome = value;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Procurar",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: !pesquisar
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            pesquisar = true;
                            filtroAtual = 0;
                            ordenarAtual = "Alfabético";
                          });
                        },
                        icon: Icon(Icons.search))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            pesquisar = false;
                            nome = "";
                          });
                        },
                        icon: Icon(Icons.close_rounded))),
          ],
        ),
        body: StreamBuilder<List<UserModel>>(
            stream: _users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final usuario = snapshot.data?.toList();
                if (ordenarAtual == "Alfabético") {
                  usuario.sort((a, b) {
                    var as = a.nome;
                    var bs = b.nome;
                    return as
                        .toString()
                        .toLowerCase()
                        .compareTo(bs.toString().toLowerCase());
                  });
                } else if (ordenarAtual == "Alfabético inversa") {
                  usuario.sort((a, b) {
                    var as = a.nome;
                    var bs = b.nome;
                    return -as
                        .toString()
                        .toLowerCase()
                        .compareTo(bs.toString().toLowerCase());
                  });
                } else if (ordenarAtual == "Horas crescente") {
                  usuario.sort((a, b) {
                    var as = a.horas;
                    var bs = b.horas;
                    return as.toString().compareTo(bs.toString());
                  });
                } else if (ordenarAtual == "Horas decrescente") {
                  usuario.sort((a, b) {
                    var as = a.horas;
                    var bs = b.horas;
                    return -as.toString().compareTo(bs.toString());
                  });
                }
                return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(children: [
                      !pesquisar
                          ? Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.filter_alt_rounded,
                                      size: 25,
                                      color: Colors.grey[300],
                                    )),
                                    TextSpan(
                                        text: "Filtrar",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600))
                                  ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.sort,
                                      size: 25,
                                      color: Colors.grey[300],
                                    )),
                                    TextSpan(
                                        text: "Ordenar",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w600))
                                  ])),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      !pesquisar
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 35,
                                    child: DropdownButton(
                                      value: filtroAtual,
                                      onChanged: (e) {
                                        setState(() {
                                          filtroAtual = e;
                                        });
                                      },
                                      items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                                          .map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            "${funcFiltro(e)}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w500),
                                          ),
                                        );
                                      }).toList(),
                                    )),
                                Container(
                                    height: 35,
                                    child: DropdownButton(
                                      value: ordenarAtual,
                                      onChanged: (e) {
                                        setState(() {
                                          ordenarAtual = e;
                                        });
                                      },
                                      items: [
                                        "Alfabético",
                                        "Alfabético inversa",
                                        "Horas crescente",
                                        "Horas decrescente"
                                      ].map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(e,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w500,
                                              )),
                                        );
                                      }).toList(),
                                    )),
                              ],
                            )
                          : SizedBox.shrink(),
                      Expanded(
                          flex: 1,
                          child: usuario.length > 0
                              ? ListView.builder(
                                  itemCount: usuario.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return UserCard(user: usuario[index]);
                                  })
                              : Center(
                                  child: Text(
                                  "Nenhum usuario foi encontrado",
                                  style: TextStyle(
                                      fontSize: 20, color: themeColor),
                                )))
                    ]));
              } else
                return Loading();
            }));
  }
}
