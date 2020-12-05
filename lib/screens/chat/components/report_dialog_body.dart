import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../core/colors.dart';

class ReportDialogBody extends StatelessWidget {
  final ChatBloc chatBloc;

  ReportDialogBody({@required this.chatBloc});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Reportar irregularidade na troca?",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Diga o que aconteceu: ",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 5.0),
            TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey)),
              ),
              minLines: 1,
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: themeColor),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        chatBloc.add(ReportEvent(report: controller.text));
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Reportar",
                        style: TextStyle(color: themeColor),
                      ),
                    ),
                  ],
                )),
          ]),
    );
  }
}
