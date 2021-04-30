import 'package:flutter/material.dart';

import '../colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  DefaultAppBar({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: themeColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: Text(
        text,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
