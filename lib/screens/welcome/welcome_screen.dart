import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../core/colors.dart';
import '../core/buttons/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  final AuthBloc authBloc;

  const WelcomeScreen({Key key, @required this.authBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.2,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BEM VINDO AO BANCO DO TEMPO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    "assets/icons/chat.svg",
                    height: size.height * 0.45,
                  ),
                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "LOGIN",
                    onpress: () {
                      authBloc.add(LoginEvent());
                    },
                  ),
                  RoundedButton(
                    text: "CADASTRE-SE",
                    color: kPrimaryLightColor,
                    textColor: Colors.black,
                    onpress: () {
                      authBloc.add(QuestionaryEvent());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
