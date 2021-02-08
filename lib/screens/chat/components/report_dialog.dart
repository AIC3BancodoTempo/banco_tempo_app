import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import 'dialog_icon.dart';
import 'report_dialog_body.dart';

buildReportDialog(BuildContext context, ChatBloc chatBloc) {
  showDialog(
    context: context,
    builder: (BuildContext context) => CustomDialog(
      chatBloc: chatBloc,
    ),
  );
}

class CustomDialog extends StatelessWidget {
  final ChatBloc chatBloc;

  CustomDialog({
    @required this.chatBloc,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    const double padding = 16.0;
    const double avatarRadius = 40.0;
    return Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: avatarRadius + padding,
          left: padding,
          right: padding,
        ),
        margin: EdgeInsets.only(top: avatarRadius),
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              )
            ]),
        child: ReportDialogBody(chatBloc: chatBloc),
      ),
      ChatDialogIcon(icon: Icons.warning),
    ]);
  }
}
