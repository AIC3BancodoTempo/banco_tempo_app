import 'package:flutter/material.dart';

import 'colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Ainda não possui uma conta ? " : "Ja possui uma conta ? ",
          style: TextStyle(color: themeColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Cadastre-se" : "Acesse",
            style: TextStyle(
              color: themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
