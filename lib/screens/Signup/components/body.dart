import 'package:banco_do_tempo_app/components/already_have_an_account_acheck.dart';
import 'package:banco_do_tempo_app/components/rounded_button.dart';
import 'package:banco_do_tempo_app/components/rounded_input_email.dart';
import 'package:banco_do_tempo_app/components/rounded_input_name.dart';
import 'package:banco_do_tempo_app/components/rounded_password_field.dart';
import 'package:banco_do_tempo_app/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
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
            RoundedInputEmail(
              hintText: "Seu e-mail",
              onChanged: (value) {},
            ),
            RoundedInputName(
              hintText: "Seu nome",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "CADASTRAR",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
