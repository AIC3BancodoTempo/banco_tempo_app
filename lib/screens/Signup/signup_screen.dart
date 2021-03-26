import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../core/already_have_an_account_acheck.dart';
import '../core/rounded_button.dart';
import '../core/rounded_input.dart';
import '../core/rounded_password_field.dart';

class SignUpScreen extends StatelessWidget {
  final AuthBloc authBloc;

  const SignUpScreen({Key key, @required this.authBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        // Here i can use size.width but use double.infinity because both work as a same
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.25,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CADASTRE-SE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.35,
                  ),
                  RoundedInput(
                      hintText: "Seu nome",
                      onChanged: (value) {},
                      icon: Icons.person),
                  RoundedInput(
                    hintText: "Seu e-mail",
                    onChanged: (value) {},
                    icon: Icons.mail,
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "CADASTRAR",
                    onpress: () {},
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      authBloc.add(LoginEvent());
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
