import 'package:banco_do_tempo_app/screens/my_posts/MyPosts.dart';
import 'package:banco_do_tempo_app/screens/pending_posts/PendingPosts.dart';
import 'package:banco_do_tempo_app/screens/chat/chat_screen.dart';
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
        '/my_posts': (context) => MyPosts(),
        '/pending_posts': (context) => PendingPosts(),
        '/chat': (context) => Chat(),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> routes = [
      {'Minhas publicações': '/my_posts'},
      {'Publicações pendentes': '/pending_posts'},
      {'Chat': '/chat'},
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
