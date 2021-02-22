import 'package:flutter/material.dart';

Widget insertInputs(insertLabel) {
  final myFocusNode = new FocusNode();
  return Align(
    alignment: Alignment.center,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
        child: TextFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.deepPurple,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.deepPurpleAccent,
              )),
              labelText: insertLabel,
              labelStyle: TextStyle(
                  color:
                      myFocusNode.hasFocus ? Colors.black38 : Colors.black45),
              hintText: 'Resposta',
              suffix: Icon(
                Icons.check,
                color: Colors.deepPurpleAccent,
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
  );
}
