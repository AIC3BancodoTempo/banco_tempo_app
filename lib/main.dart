import 'package:banco_do_tempo_app/screens/TrocasAndamento.dart';
import 'package:banco_do_tempo_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'components/sidebar_admin.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(   
        primaryColor: Colors.purple[400],
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    home: MyHomePage(),

      routes: {
        '/': (context) => MyHomePage(),
        '/trocas_andamento': (context) => TrocasAndamento(),
      },
      initialRoute: '/',
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> routes = [
      {'Trocas em andamento': '/trocas_andamento'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Início"),
      ),
      drawer:SideBarAdm(),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, routes[index].values.first);
            },
            title: Text(routes[index].keys.first),
          );
        },
      ),
    );
  }
}