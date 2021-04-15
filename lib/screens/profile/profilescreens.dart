import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'components/background_image.dart';
import 'components/perfil_image.dart';
import 'components/right_side_text.dart';
import 'components/profile_form.dart';

class Profilescreen extends StatefulWidget {
  final UserModel userModel;

  const Profilescreen({Key key, @required this.userModel}) : super(key: key);
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              //alignment: Alignment.topLeft,
              children: [
                BackgroundImage(
                  image:
                      'https://ak.picdn.net/shutterstock/videos/12573827/thumb/1.jpg',
                ),
                PerfilImage(),
              ],
            ),
            RightTextProfile(
              name: "Sofia Oliveira",
              acumulatedHours: "12.5 horas acumuladas",
            ),
            ProfileForm(),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 4,
              endIndent: 100,
              indent: 100,
            ),
          ],
        ),
      ),
    );
  }
}
