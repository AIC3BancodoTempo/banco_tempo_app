import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  ChatTextField({@required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.multiline,
        autocorrect: false,
        autofocus: true,
        enableSuggestions: true,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        enableInteractiveSelection: true,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: "Digite sua mensagem...",
            hintStyle: TextStyle(color: Colors.grey.shade500),
            border: InputBorder.none),
      ),
    );
  }
}
