import 'dart:ui';

import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ChangeHour extends StatefulWidget {
  final double horas;
  final String id;
  final String nome;

  const ChangeHour({Key key, this.horas, this.id, this.nome}) : super(key: key);

  @override
  State<ChangeHour> createState() => _ChangeHourState();
}

class _ChangeHourState extends State<ChangeHour> {
  String novaHora = "";

  @override
  Widget build(BuildContext context) {
    Future attHoras() async {
      await FirebaseFirestore.instance.collection("admin").doc("log").update({
        "logHoras": FieldValue.arrayUnion([
          "${DateFormat('dd/MM/yyyy').format(DateTime.now())},${widget.nome},${widget.horas},${double.parse(novaHora)}"
        ])
      });
      return await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.id)
          .update({"horas": double.parse(novaHora)});
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black54,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Trocar horas de ${widget.nome}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}'))
                            ],
                            autofocus: true,
                            textAlign: TextAlign.right,
                            initialValue:
                                this.widget.horas.toDouble().toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                            onChanged: (valor) {
                              setState(() {
                                novaHora = valor;
                              });
                              print(novaHora.length);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Horas",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.start,
                            ))
                      ],
                    ),
                    Opacity(
                      opacity: novaHora.length == 0 ||
                              novaHora == widget.horas.toDouble().toString()
                          ? 0.3
                          : 1,
                      child: TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(90))),
                          onPressed: () {
                            if (novaHora.length != 0 &&
                                novaHora !=
                                    widget.horas.toDouble().toString()) {
                              attHoras();
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Confirmar",
                            style: TextStyle(color: white),
                          )),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
