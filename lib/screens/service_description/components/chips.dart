import 'package:flutter/material.dart';

class Chips extends StatefulWidget {
  final String hora;
  final int defaultValue;
  final List<DropdownMenuItem> dropList;
  final Function onChanged;

  const Chips(
      {Key key,
      @required this.hora,
      @required this.dropList,
      this.onChanged,
      this.defaultValue})
      : super(key: key);

  @override
  _ChipsState createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  String defValue;

  @override
  void initState() {
    defValue = widget.defaultValue > 0 ? widget.defaultValue.toString() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 100.0,
      children: [
        // new Chip(
        //   label: Text('1 Unidade'),
        // ),
        Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[350],
              ),
              color: Colors.grey[350],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: DropdownButton<String>(
            value: defValue,
            hint: Text(" 1.0 Hora"),
            items: widget.dropList,
            onChanged: (value) {
              setState(() {
                defValue = value;
              });
              widget.onChanged(value);
            },
          ),
        ),
        /*Container(
          height: 35,
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[350],
              ),
              color: Colors.grey[350],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Chip(
            label: Text(widget.hora + ' Hora'),
          ),
        ),*/
      ],
    );
  }
}
