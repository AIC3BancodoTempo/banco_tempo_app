import 'package:flutter/material.dart';

class PerfilImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
                image: AssetImage("assets/images/profile.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
