import 'package:flutter/material.dart';

class InsertInputs extends StatelessWidget {
  final TextEditingController controller;
  final int maxlines;
  final String insertLabel;
  final Function onChanged;
  final TextInputType keyboardType;
  const InsertInputs(
      {Key key,
      @required this.insertLabel,
      this.onChanged,
      this.controller,
      this.keyboardType,
      this.maxlines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myFocusNode = new FocusNode();
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
          child: TextFormField(
            maxLines: maxlines,
            keyboardType: keyboardType,
            onChanged: (value) {
              onChanged(value);
            },
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
}
