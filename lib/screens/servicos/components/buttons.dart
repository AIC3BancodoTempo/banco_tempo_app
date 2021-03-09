import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              color: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
