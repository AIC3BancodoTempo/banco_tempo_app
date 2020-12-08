import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title, subtitle, imageUrl;
  final int amount, timeAmount;
  final bool renderActionButtons;

  PostCard({
    Key key,
    this.title,
    this.subtitle,
    this.imageUrl,
    this.amount,
    this.timeAmount,
    this.renderActionButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.black12),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(this.subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: LayoutBuilder(
                      builder: (BuildContext context, constraints) {
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
                              TextButton(
                                  onPressed: () {}, child: Text("Aceitar")),
                              SizedBox(width: 30.0),
                              TextButton(
                                  onPressed: () {}, child: Text("Rejeitar")),
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
                  }))
            ],
          ),
          CircleAvatar(
              radius: 40.0, backgroundImage: NetworkImage(this.imageUrl))
        ],
      ),
    );
  }
}
