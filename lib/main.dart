import 'package:banco_do_tempo_app/screens/TrocasAndamento.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple[400],
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
