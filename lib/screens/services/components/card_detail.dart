import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key key,
    @required this.title,
    @required this.hour,
    @required this.amount,
  }) : super(key: key);

  final String title;
  final double hour;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        amount.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        ' und',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        hour.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        " horas",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
