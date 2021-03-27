import 'package:flutter/material.dart';

import '../../core/models/user_model.dart';
import 'components/button.dart';
import 'components/header.dart';
import 'components/textfield.dart';

class Profilescreen extends StatefulWidget {
  final UserModel userModel;
  Profilescreen({Key key, @required this.userModel}) : super(key: key);

  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ProfileHeader(),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.fromLTRB(2, 20, 2, 15),
            child: Column(
              children: <Widget>[
                ProfileTextField(
                  inputType: TextInputType.text,
                  label: "Nome de Usuário",
                  onChanged: (value) {
                    print(value);
                  },
                  leadingIcon: Icons.person,
                ),
                ProfileTextField(
                  inputType: TextInputType.emailAddress,
                  label: "E-mail",
                  onChanged: (value) {
                    print(value);
                  },
                  leadingIcon: Icons.mail,
                ),
                ProfileTextField(
                  inputType: TextInputType.text,
                  label: "Senha",
                  onChanged: (value) {
                    print(value);
                  },
                  leadingIcon: Icons.lock,
                ),
              ],
            ),
          ),
          ProfileButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
