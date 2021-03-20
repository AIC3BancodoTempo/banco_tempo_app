import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String question;
  final String hintText;
  final Function onChanged;
  CustomTextFormField(
      {@required this.question,
      @required this.hintText,
      @required this.onChanged});
  final myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
              child: TextFormField(
                onChanged: (value) {
                  onChanged(value);
                },
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: themeSimpleColor,
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: themeSimpleColor,
                    )),
                    labelText: this.question,
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.black38
                            : Colors.black),
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
        ),
      ],
    );
  }
}
