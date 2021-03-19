import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileButton({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
      color: Colors.white,
      textColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      onPressed: () {
        onPressed();
      },
      child: Text(
        "Atualizar".toUpperCase(),
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
