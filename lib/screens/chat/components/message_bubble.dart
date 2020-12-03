import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/profile_image.dart';

class ChatMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment:
            1 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: SelectableText(
                  "Me dá sorvete",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ProfileImage(
                  radius: 10,
                  image:
                      "https://i.pinimg.com/originals/fa/34/07/fa3407bbfc876fd7e1019238c5b6984f.jpg"),
            ]),
          ),
          Container(
            child: Row(
                mainAxisAlignment:
                    1 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy kk:mm').format(DateTime.now()),
                    style:
                        TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(width: 10.0),
                  1 == 0
                      ? Icon(Icons.check,
                          color: true ? Colors.blue : Colors.grey)
                      : Container()
                ]),
            margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
          )
        ],
      ),
    );
  }
}
