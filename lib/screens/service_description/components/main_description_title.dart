import 'package:flutter/material.dart';

import '../../core/colors.dart';

class MainTitle extends StatelessWidget {
  final String title;
  final String tempo;

  const MainTitle({Key key, @required this.title, @required this.tempo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            tempo + " Hora",
            style: TextStyle(
              fontSize: 16,
              color: themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
