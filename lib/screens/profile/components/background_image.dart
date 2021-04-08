import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String image;

  const BackgroundImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      fit: BoxFit.cover,
      image: NetworkImage(image),
    );
  }
}
