import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://drive.google.com/file/d/1PcU8-GYK90bVK2YG6O3OeAH2FcAu4Gzo/view?usp=sharing');
                    }),
              TextSpan(text: " do banco do tempo!")
            ]),
      ),
    );
  }
}
