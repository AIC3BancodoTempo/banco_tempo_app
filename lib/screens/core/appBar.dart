import 'package:flutter/material.dart';

class BuildAppBar extends PreferredSize {
  final String insertText;

  const BuildAppBar({Key key, @required this.insertText});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {},
      ),
      centerTitle: true,
      backgroundColor: Color(0xFFA95EFA),
      title: Text(
        insertText,
      ),
    );
  }
}
