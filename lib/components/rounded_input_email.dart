import 'package:banco_do_tempo_app/components/text_field_container.dart';
import 'package:banco_do_tempo_app/core/colors.dart';
import 'package:flutter/material.dart';

class RoundedInputEmail extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputEmail({
    Key key,
    this.hintText,
    this.icon = Icons.email,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
