import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    @required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: ShapeDecoration(
          image: DecorationImage(
              image: imgUrl.isNotEmpty
                  ? NetworkImage(imgUrl)
                  : AssetImage('assets/images/noimage.jpg'),
              fit: BoxFit.fitHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15),
              topStart: Radius.circular(15),
            ),
          ),
        ),
        width: double.maxFinite,
        height: 100,
      ),
    );
  }
}
