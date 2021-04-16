import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

class PerfilImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 110,
      bottom: -60.0,
      child: Container(
        width: 170.0,
        height: 170.0,
        child: CircleAvatar(
          radius: 80,
          backgroundColor: white,
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(new Radius.circular(100.0)),
          border: new Border.all(
            color: white,
            width: 4.0,
          ),
        ),
      ),
    );
  }
}
