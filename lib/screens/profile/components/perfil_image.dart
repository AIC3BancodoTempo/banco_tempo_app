import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PerfilImage extends StatelessWidget {
  String fotoURL;
  PerfilImage(this.fotoURL);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120), //10
            height: 140, //140
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4, //8
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: this.fotoURL != ""
                    ? NetworkImage(this.fotoURL)
                    : AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
