import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../colors.dart';

class ButtonDescriptionAndAdd extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onpress;
  const ButtonDescriptionAndAdd(
      {Key key,
      @required this.onpress,
      @required this.text,
      @required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      minWidth: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 8.0),
            Icon(
              iconData,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () {
          onpress();
        },
      ),
    );
  }
}
