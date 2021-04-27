import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class FormDropDown extends StatefulWidget {
  final Function validator;
  final Function onChanged;
  final String value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  const FormDropDown(
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

class _FormDropDownState extends State<FormDropDown> {
  String padrao;
  @override
  void initState() {
    padrao = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutlineDropdownButtonFormField(
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
