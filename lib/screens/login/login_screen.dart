import 'package:banco_do_tempo_app/screens/core/buttons/already_have_an_account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../core/validations.dart';

import '../core/buttons/forgot_password_button.dart';
import '../core/buttons/rounded_button.dart';
import '../core/rounded_input.dart';
import '../core/rounded_password_field.dart';

class LoginScreen extends StatelessWidget {
  final AuthBloc authBloc;

  LoginScreen({Key key, @required this.authBloc}) : super(key: key);
  final TextEditingController emailCntrlr = TextEditingController();
  final TextEditingController passCntrlr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedInput(
                        hintText: "Seu e-mail",
                        controller: emailCntrlr,
                        icon: Icons.mail,
                        validator: validateEmail),
                    RoundedPasswordField(
                        controller: passCntrlr, validator: validateSenha),
                    ForgotPassword(
                      press: () {
                        authBloc.add(ForgotEvent());
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedButton(
                      text: "LOGIN",
                      onpress: () {
                        if (validateAndSave(formKey)) {
                          authBloc.add(LoginEmailEvent(
                              email: emailCntrlr.text, senha: passCntrlr.text));
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        authBloc.add(QuestionaryEvent());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
