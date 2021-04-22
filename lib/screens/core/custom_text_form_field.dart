import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String question;
  final bool enabled;
  final String hintText;
  final Function onChanged;
  final Icon icon;
  CustomTextFormField(
      {@required this.question,
      @required this.hintText,
      @required this.onChanged,
      this.icon,
      this.enabled = true});
  final myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            child: TextFormField(
              onChanged: (value) {
                onChanged(value);
              },
              enabled: enabled,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: themeSimpleColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: themeSimpleColor,
                    ),
                  ),
                  prefixIcon: icon,
                  labelText: this.question,
                  labelStyle: TextStyle(
                      color:
                          myFocusNode.hasFocus ? Colors.black38 : Colors.black),
                  hintText: this.hintText,
                  suffix: Icon(
                    Icons.check,
                    color: themeSimpleColor,
                    size: 15.0,
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Você esqueceu de responder';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
