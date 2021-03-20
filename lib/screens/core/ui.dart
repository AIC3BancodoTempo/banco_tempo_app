import 'package:flutter/material.dart';

import 'wait_dialog.dart';

class UiBuilder {
  final GlobalKey<State> keyLoader;

  UiBuilder({@required this.keyLoader});

  void buildLoadingUi(BuildContext context) {
    Dialogs.showLoadingDialog(context, keyLoader);
  }

  void closeLoadingUi() {
    Navigator.of(keyLoader.currentContext, rootNavigator: true).pop();
  }

  void buildSnackBarUi(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
