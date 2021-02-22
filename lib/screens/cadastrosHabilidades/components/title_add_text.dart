import 'package:flutter/material.dart';

Widget titleAddText(insertTitleHere) {
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
