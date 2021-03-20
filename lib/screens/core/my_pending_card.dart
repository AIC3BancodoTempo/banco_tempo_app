import 'package:flutter/material.dart';

class PendingPostCard extends StatelessWidget {
  final renderActionButtons;
  final amount;
  final timeAmount;
  PendingPostCard(
      {@required this.renderActionButtons,
      @required this.amount,
      @required this.timeAmount});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: LayoutBuilder(builder: (BuildContext context, constraints) {
          if (renderActionButtons) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(this.amount.toString() + " und"),
                    SizedBox(width: 30.0),
                    Text(this.timeAmount.toString() + " hora"),
                  ],
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text("Aceitar")),
                    SizedBox(width: 30.0),
                    TextButton(onPressed: () {}, child: Text("Rejeitar")),
                  ],
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Text(this.amount.toString() + " und"),
                SizedBox(width: 30.0),
                Text(this.timeAmount.toString() + " hora"),
              ],
            );
          }
        }));
  }
}
