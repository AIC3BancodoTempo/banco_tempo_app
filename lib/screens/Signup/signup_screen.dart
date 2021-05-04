import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../core/validations.dart';
import '../core/buttons/already_have_an_account_button.dart';
import '../core/buttons/rounded_button.dart';
import '../core/rounded_input.dart';
import '../core/rounded_password_field.dart';

class SignUpScreen extends StatelessWidget {
  final AuthBloc authBloc;

  SignUpScreen({Key key, @required this.authBloc}) : super(key: key);
  final TextEditingController emailCntrlr = TextEditingController();
  final TextEditingController passCntrlr = TextEditingController();
  final TextEditingController nomeCntrlr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        controller: nomeCntrlr,
                        validator: validateEmptyField,
                        icon: Icons.person),
                    RoundedInput(
                      hintText: "Seu e-mail",
                      controller: emailCntrlr,
                      validator: validateEmail,
                      icon: Icons.mail,
                    ),
                    RoundedPasswordField(
                      controller: passCntrlr,
                      validator: validateSenha,
                    ),
                    RoundedButton(
                      text: "CADASTRAR",
                      onpress: () {
                        if (validateAndSave(formKey)) {
                          authBloc.add(CreateLoginEmailEvent(
                              email: emailCntrlr.text,
                              senha: passCntrlr.text,
                              nome: nomeCntrlr.text));
                        }
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
