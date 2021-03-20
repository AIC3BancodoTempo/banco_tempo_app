import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final IconData leadingIcon;
  final TextInputType inputType;
  final Function onChanged;

  const ProfileTextField(
      {Key key,
      @required this.label,
      @required this.leadingIcon,
      @required this.inputType,
      @required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(leadingIcon, color: Colors.black),
        title: TextField(
          onChanged: (value) {
            onChanged(value);
          },
          keyboardType: inputType,
          decoration: InputDecoration(
              labelText: label, labelStyle: TextStyle(color: Colors.black)),
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ));
  }
}
