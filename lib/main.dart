import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/app.dart';
import 'screens/cadastros_habilidades/cadastro_habilidade.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/descricao_habilidade/descricao_card.dart';
import 'screens/my_posts/my_posts.dart';
import 'screens/pending_posts/pending_posts.dart';
import 'screens/profile/profilescreens.dart';
import 'screens/trocas_andamento/trocas_andamento.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Run());
}

class Run extends StatelessWidget {
  User user;

  setUser(User value) {
    user = value;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco do Tempo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(setUser: setUser),
      routes: {
        '/trocasAndamento': (context) => TrocasAndamento(),
        '/chat': (context) => Chat(
              user: user,
            ),
        '/cadastroHabilidades': (context) => AddAbilityPage(),
        '/descricaoHabilidades': (context) => AbilityDescriptionPage(),
        '/profile': (context) => Profilescreen(),
        '/myPosts': (context) => MyPosts(),
        '/pendingPosts': (context) => PendingPosts(),
      },
      initialRoute: '/',
    );
  }
}
