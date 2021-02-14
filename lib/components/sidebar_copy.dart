import 'package:flutter/material.dart';



class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

bool isAdmin = true;
class _SideBarState extends State<SideBar> {
  final userDrawer = Drawer (
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: 
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 35.0,
                        ),//CircleAvatar
                        ),//Align
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text ('Lorem',
                          style: TextStyle(fontSize:20.0,),
                          ),//Text
                        ),//Align
                        Align(
                          alignment: Alignment.centerRight + Alignment(0, .3),
                          child: Text('Horas acumuladas: 20:00',
                          style: TextStyle(),
                          ),
                        ),
                    ],
                  ),
                  
                ),//DrawerHeader
              
                //USUÁRIOS ABAIXO
                ListTile(
                  trailing: Icon(Icons.article_outlined),
                  title: Text("Meus cadastros", 
                  style: TextStyle()),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.autorenew),
                  title: Text("Trocas em andamento"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.account_circle_outlined),
                  title: Text("Meu perfil"),
                  onTap: () {},
                ),
              
                  ListTile(

                  trailing: Icon(Icons.article_outlined),
                  title: Text("Meus cadastros", 
                  style: TextStyle()),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.autorenew),
                  title: Text("Trocas em andamento"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.account_circle_outlined),
                  title: Text("Meu perfil"),
                  onTap: () {},
                ),
                ListTile(

                  trailing: Icon(Icons.notifications_none),
                  title: Text("Perguntas Frequentes"),
                  onTap: () {},
                ),
                //ADMIN ABAIXO, queria por um IF is Admin == true exibe esses 2 ListTiles junto de usuário, não consegui
                  ListTile(
                  trailing: Icon(Icons.add_rounded),
                  title: Text("Divulgações pendentes"),
                  onTap: () {},
                ),

                ListTile(

                  trailing: Icon(Icons.notifications_none),
                  title: Text("Perguntas Frequentes - Administração"),
                  onTap: () {},
                ),
              ],
            ),
      
  );

  @override
  Widget build(BuildContext context) {
    return userDrawer;
  }
}