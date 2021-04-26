import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class FormDropDownUnderline extends StatefulWidget {
  final Function validator;
  final Function onChanged;
  final String value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  const FormDropDownUnderline(
      {Key key,
      @required this.validator,
      @required this.onChanged,
      this.value,
      @required this.items,
      @required this.hint})
      : super(key: key);

  @override
  _FormDropDownState createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDownUnderline> {
  String padrao;
  @override
  void initState() {
    padrao = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
      ),
      validator: widget.validator,
      value: padrao != null ? padrao : null,
      items: widget.items,
      isExpanded: true,
      hint: Text(widget.hint),
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {
          padrao = value;
        });
      },
    );
  }
}
