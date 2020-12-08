import 'package:banco_do_tempo_app/screens/my_posts/MyPosts.dart';
import 'package:banco_do_tempo_app/screens/pending_posts/PendingPosts.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.purple[400],
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/my_posts': (context) => MyPosts(),
        '/pending_posts': (context) => PendingPosts(),
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
                title: Text(routes[index].keys.first));
          },
        ));
  }
}
