import 'package:flutter/material.dart';

class PerfilImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 95,
      bottom: -60.0,
      child: Container(
        width: 200.0,
        height: 200.0,
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
          border: new Border.all(
            color: Colors.white,
            width: 4.0,
          ),
        ),
      ),
    );
  }
}
