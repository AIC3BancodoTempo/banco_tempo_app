import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String pergunta;
  final String resposta;
  final List<String> opcoes;

  const CustomDropdown({Key key, this.pergunta, this.resposta, this.opcoes})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String selectedSalutation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.pergunta,
                  textScaleFactor: 1.4,
                  style: TextStyle(
                      fontFamily: 'Roboto', fontWeight: FontWeight.bold))),
          DropdownButtonFormField<String>(
            isExpanded: true,
            value: selectedSalutation,
            hint: Text(
              'Escolha uma das opções.',
            ),
            onChanged: (salutation) =>
                setState(() => selectedSalutation = salutation),
            validator: (value) =>
                value == widget.resposta ? 'Resposta Incorreta' : null,
            items: widget.opcoes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
