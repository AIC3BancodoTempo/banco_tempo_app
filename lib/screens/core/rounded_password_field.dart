import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Function validator;
  RoundedPasswordField({
    Key key,
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        validator: widget.validator,
        onChanged: widget.onChanged,
        cursorColor: themeColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: themeColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: new Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
