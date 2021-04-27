import 'package:flutter/material.dart';

class RightTextProfile extends StatelessWidget {
  final String name;
  final String acumulatedHours;

  const RightTextProfile(
      {Key key, @required this.name, @required this.acumulatedHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 65, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                acumulatedHours,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
