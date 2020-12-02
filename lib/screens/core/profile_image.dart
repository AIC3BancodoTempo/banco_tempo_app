import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  String image;

  ProfileImage({@required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(image),
      maxRadius: 20,
    );
  }
}
