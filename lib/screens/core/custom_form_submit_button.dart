import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomFormSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomFormSubmitButton(
      {Key key, @required this.onPressed, @required this.text})
      : super(key: key);
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: SizedBox(
        height: 44,
        width: 305,
        child: RawMaterialButton(
            fillColor: Color.fromRGBO(169, 94, 250, 1),
            splashColor: Color.fromRGBO(138, 73, 247, 1),
            shape: const StadiumBorder(),
            onPressed: () {
              onPressed();
              // Validate returns true if the form is valid, or false
              // otherwise.
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 8.0),
                const Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                ),
              ],
            )),
      ),
    );
  }
}
