import 'package:flutter/material.dart';

class TitleAddText extends StatelessWidget {
  final String insertTitleHere;

  const TitleAddText({Key key, @required this.insertTitleHere})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Text(insertTitleHere,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSans',
                  fontStyle: FontStyle.normal,
                  fontSize: 23)),
        ),
      ),
    );
  }
}
