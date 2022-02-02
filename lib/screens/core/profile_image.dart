import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final double radius;

  ProfileImage({@required this.image, @required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: image != ""
          ? NetworkImage(image)
          : AssetImage("assets/images/profile.png"),
      maxRadius: radius,
    );
  }
}
