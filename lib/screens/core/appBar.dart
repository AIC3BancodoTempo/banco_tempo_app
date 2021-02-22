import 'package:flutter/material.dart';

Widget buildAppBar(insertText) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {},
    ),
    centerTitle: true,
    backgroundColor: Color(0xFFA95EFA),
    title: Text(
      insertText,
    ),
  );
}
