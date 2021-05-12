import '../../core/colors.dart';
import 'package:flutter/material.dart';

class OfferType extends StatefulWidget {
  final Function onChange;
  const OfferType({Key key, this.onChange}) : super(key: key);

  @override
  _OfferTypeState createState() => _OfferTypeState();
}

class _OfferTypeState extends State<OfferType> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: checkBoxValue,
            activeColor: themeColor,
            onChanged: (newValue) => setState(() {
              checkBoxValue = newValue;
              widget.onChange(newValue);
            }),
          ),
          Text("Marque caso seja algo que esteja procurando")
        ],
      ),
    );
  }
}
