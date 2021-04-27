import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/models/user_model.dart';
import 'screens/app.dart';
import 'screens/cadastros_habilidades/add_service.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/core/colors.dart';
import 'screens/descricao_habilidade/descricao_habilidade.dart';
import 'screens/my_posts/my_posts.dart';
import 'screens/pending_posts/pending_posts.dart';
import 'screens/profile/profilescreens.dart';
import 'screens/trocas_andamento/trocas_andamento.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
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
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(425, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      title: 'Banco do Tempo',
      theme: ThemeData(
        primaryColor: themeColor,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(setUser: setUser),
      routes: {
        '/trocasAndamento': (context) => TrocasAndamento(user: _user),
        '/chat': (context) => Chat(
              user: _user,
              userModel: _userModel,
            ),
        '/cadastroHabilidades': (context) => AddAbility(user: _userModel),
        '/descricaoHabilidades': (context) => HabilityDescription(user: _user),
        '/profile': (context) => Profilescreen(
              userModel: _userModel,
            ),
        '/myPosts': (context) => MyPosts(
              user: _user,
            ),
        '/pendingPosts': (context) => PendingPost(),
      },
      initialRoute: '/',
    );
  }
}
