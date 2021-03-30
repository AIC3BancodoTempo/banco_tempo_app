import 'package:flutter/material.dart';

import 'colors.dart';

class ForgotPassword extends StatelessWidget {
  final Function press;
  const ForgotPassword({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Esqueceu a sua senha? ",
          style: TextStyle(color: themeColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Clique aqui",
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
