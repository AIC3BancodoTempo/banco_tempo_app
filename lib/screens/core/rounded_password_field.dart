import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Function validator;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        obscureText: true,
        validator: validator,
        onChanged: onChanged,
        cursorColor: themeColor,
        decoration: InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: themeColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: themeColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
