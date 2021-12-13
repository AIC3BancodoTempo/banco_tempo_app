import 'package:flutter/material.dart';

class CardProfile extends StatefulWidget {
  const CardProfile({ Key key}) : super(key: key);

  @override
  _CardProfileState createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.deepPurple[300],
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    radius: 32,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nome completo",style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
                          Container(height: 5,),
                          Text("Cidade - RS",style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                    )
                  ), 
                  IconButton(
                    icon: Icon(Icons.chat,color: Colors.white,size: 45),
                    onPressed: (){},
                  )
                ],
              ),
            ),
          );
  }
}