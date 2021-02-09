import 'package:flutter/material.dart';

Widget mainButton() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
    child: SizedBox(
      height: 44,
      width: 305,
      child: RawMaterialButton(
          fillColor: Color.fromRGBO(169, 94, 250, 1),
          splashColor: Color.fromRGBO(138, 73, 247, 1),
          shape: const StadiumBorder(),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CADASTRAR',
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
