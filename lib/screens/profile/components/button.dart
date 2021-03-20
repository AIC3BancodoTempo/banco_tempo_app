import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileButton({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.all(8.0),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        "Atualizar".toUpperCase(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
