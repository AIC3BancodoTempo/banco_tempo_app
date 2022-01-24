import 'package:banco_do_tempo_app/resources/fotos/FotosPerfil.dart';
import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  final String nome;
  final String foto;
  const CardProfile({ Key key, this.nome, this.foto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.deepPurple[300],
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){Navigator.of(context).push(PageRouteBuilder(barrierDismissible: true,opaque: false,pageBuilder: (_, __, ___) => FullscreenImage(foto:this.foto)));},
                    child: CircleAvatar(
                      backgroundImage: this.foto != "" ? NetworkImage(this.foto) : AssetImage("assets/images/profile.png"),
                      radius: 32,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.nome,style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                          Container(height: 5,),
                          Text("Rio Grande - RS",style: TextStyle(fontSize: 15,color: Colors.white),)
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