import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() =>
      _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String selectedSalutation;
  

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Padding (
        padding: const EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
        child: Column(
              
              children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Quem descobriu o Brasil?", 
                        textScaleFactor: 1.4, 
                        style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                  DropdownButtonFormField<String>(              
                    value: selectedSalutation,              
                    hint: Text(
                      'Escolha uma das opções.',
                    ),
                    onChanged: (salutation) =>
                        setState(() => selectedSalutation = salutation),
                    validator: (value) => value == null ? 'Campo Obrigatório' : null,
                    items:
                        ['A', 'B', 'C', 'D', 'E'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )          
                ]
          )
        )
      );
    }
}