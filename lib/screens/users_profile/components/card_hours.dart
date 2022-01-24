import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:banco_do_tempo_app/screens/users_profile/components/changeHour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardHours extends StatefulWidget {
  final String id;
  const CardHours({ Key key, this.id }) : super(key: key);

  @override
  _CardHoursState createState() => _CardHoursState();
}

class _CardHoursState extends State<CardHours> {

  

  @override

  UserModel _usuario (DocumentSnapshot snapshot){
      return UserModel(
        key: snapshot.id,
        nome: snapshot['nome'] ?? "",
        horas: snapshot['horas'].toDouble() ?? 0,
      );
    }

    Stream<UserModel> get _user{
      return FirebaseFirestore.instance.collection("users").doc(widget.id).snapshots().map(_usuario);
    }
  Widget build(BuildContext context) {

    


    return StreamBuilder<UserModel>(
      stream: _user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final info = snapshot.data;
          return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          margin: EdgeInsets.symmetric(horizontal:18),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 75),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => ChangeHour(horas: info.horas.toInt(),nome: info.nome,id: info.key,)));},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_sharp,size: 40,color: themeColor,),
                  SizedBox(width: 7,),
                  Text(info.horas.toString()+" horas", style: TextStyle(fontSize: 30,color: themeColor,fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ),
        );
        }
        else return Loading();
      }
    );
  }
}