import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  String image;
  double radius;

  ProfileImage({@required this.image, @required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(image),
      maxRadius: radius,
    );
  }
}
