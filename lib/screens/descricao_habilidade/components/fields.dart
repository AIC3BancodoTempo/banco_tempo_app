import 'package:flutter/material.dart';

Widget spaceVertical(double size) {
  return SizedBox(
    height: size,
  );
}

Widget spaceHorizontal(double size) {
  return SizedBox(
    width: size,
  );
}

Widget description() {
  return Text(
    "A style icon gets some love from one of today's top "
    "trendsetters. Pharrell Williams puts his creative spin on these "
    "shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
    textAlign: TextAlign.justify,
    style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
  );
}
