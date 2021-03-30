import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/models/user_model.dart';
import 'screens/app.dart';
import 'screens/cadastros_habilidades/cadastro_habilidade.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/core/colors.dart';
import 'screens/descricao_habilidade/descricao_habilidade.dart';
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
  User _user;
  UserModel _userModel;

  setUser(User value, UserModel model) {
    _user = value;
    _userModel = model;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco do Tempo',
      theme: ThemeData(
        primaryColor: themeColor,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(setUser: setUser),
      routes: {
        '/trocasAndamento': (context) => TrocasAndamento(),
        '/chat': (context) => Chat(
              user: _user,
            ),
        '/cadastroHabilidades': (context) => AddAbilityPage(),
        '/descricaoHabilidades': (context) => HabilityDescription(
              user: _user,
            ),
        '/profile': (context) => Profilescreen(
              userModel: _userModel,
            ),
        '/myPosts': (context) => MyPosts(),
        '/pendingPosts': (context) => PendingPosts(),
      },
      initialRoute: '/',
    );
  }
}
