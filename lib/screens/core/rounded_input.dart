import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_field_container.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final Function onChanged;
  final Function validator;
  final TextInputType keyboardType;
  const RoundedInput(
      {Key key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        cursorColor: themeColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: themeColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
