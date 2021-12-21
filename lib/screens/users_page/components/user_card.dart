import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:banco_do_tempo_app/screens/users_profile/users_profile.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {

  final String nome;
  final num horas;
  final String id;

  const UserCard({ Key key, this.nome, this.horas, this.id }) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(nome: widget.nome,horas: widget.horas, id: widget.id)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 32,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.nome,style: TextStyle(fontSize: 19,color: themeColor,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
                        Container(height: 5,),
                        Text("Rio Grande - RS",style: TextStyle(fontSize: 15,color: Colors.grey[500]),)
                      ],
                    ),
                  ),
                )
              ), 
              Container(
                
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5,color: themeColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                  child: Center(child: Text(widget.horas.toString()+" HORAS",style: TextStyle(fontSize: 19,color: themeColor))),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}