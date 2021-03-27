import 'package:flutter/material.dart';

class TermsButton extends StatelessWidget {
  final VoidCallback onpress;
  const TermsButton({
    Key key,
    @required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontFamily: 'DM Sans',
                letterSpacing: 0.4,
                fontSize: 14),
            children: [
              TextSpan(text: 'Clique aqui para acessar as informações dos  '),
              TextSpan(
                  text: 'Termos e Condições',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextSpan(text: " do banco do tempo!")
            ]),
      ),
    );
  }
}
