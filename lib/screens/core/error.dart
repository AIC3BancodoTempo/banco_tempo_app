import 'package:flutter/material.dart';

import 'colors.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: themeSimpleColor, size: 200.0),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 20.0, top: 20.0),
              child: Text(
                message,
                style: TextStyle(
                  color: themeSimpleColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
