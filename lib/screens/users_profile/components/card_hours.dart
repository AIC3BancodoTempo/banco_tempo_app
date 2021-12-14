import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

class CardHours extends StatefulWidget {
  final num horas;
  const CardHours({ Key key, this.horas }) : super(key: key);

  @override
  _CardHoursState createState() => _CardHoursState();
}

class _CardHoursState extends State<CardHours> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      margin: EdgeInsets.symmetric(horizontal:18),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time_sharp,size: 40,color: themeColor,),
            Container(width: 7,),
            Text(widget.horas.toString()+" horas", style: TextStyle(fontSize: 30,color: themeColor,fontWeight: FontWeight.bold),
            )
          ],
        )
      ),
    );
  }
}