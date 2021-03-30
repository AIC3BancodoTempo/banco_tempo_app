import 'package:flutter/material.dart';

import '../colors.dart';

class BuildAppBar extends PreferredSize {
  final String insertText;

  const BuildAppBar({Key key, @required this.insertText});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {},
      ),
      centerTitle: true,
      backgroundColor: themeColor,
      title: Text(
        insertText,
      ),
    );
  }
}
