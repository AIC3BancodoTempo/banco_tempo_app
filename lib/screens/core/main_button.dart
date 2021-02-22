import 'package:flutter/material.dart';

Widget mainButton(mainTextButton, iconType) {
  return ButtonTheme(
    height: 50,
    minWidth: 300,
    child: RaisedButton(
      color: Color(0xFFA95EFA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            mainTextButton,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 8.0),
          Icon(
            iconType,
            color: Colors.white,
          ),
        ],
      ),
      onPressed: () {},
    ),
  );
}
