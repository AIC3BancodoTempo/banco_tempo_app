import 'package:banco_do_tempo_app/core/models/logModel.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogHoras extends StatelessWidget {
  LogHoras({Key key}) : super(key: key);

  Log _loghoras(DocumentSnapshot snapshot) {
    return Log(logHoras: snapshot["logHoras"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text("Historico de mudanças"),
      ),
      body: StreamBuilder<Log>(
          stream: FirebaseFirestore.instance
              .collection("admin")
              .doc("log")
              .snapshots()
              .map(_loghoras),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final log = snapshot.data.logHoras.toList().reversed.toList();
              return log.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ListView.builder(
                          itemCount: log.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<String> lista =
                                log[index].toString().split(",");
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${lista[0]}",
                                      style: TextStyle(
                                          color:
                                              Colors.black45.withOpacity(0.3),
                                          fontSize: 13)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: "${lista[1]}: ",
                                            style: TextStyle(
                                                color: themeColor,
                                                fontSize: 17),
                                          ),
                                          TextSpan(
                                            text: "de ",
                                          ),
                                          TextSpan(
                                              text: "${lista[2]}: ",
                                              style: TextStyle(
                                                  color: themeColor,
                                                  fontSize: 17)),
                                          TextSpan(
                                            text: "para ",
                                          ),
                                          TextSpan(
                                              text: "${lista[3]} ",
                                              style: TextStyle(
                                                  color: themeColor,
                                                  fontSize: 17)),
                                        ]),
                                  ),
                                  Divider(
                                    height: 50,
                                    thickness: 0.5,
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  : Center(
                      child: Text("Não há historico"),
                    );
            } else
              return Loading();
          }),
    );
  }
}
