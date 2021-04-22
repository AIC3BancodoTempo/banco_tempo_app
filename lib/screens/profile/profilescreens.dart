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
<<<<<<< Updated upstream
      body: ListView(
        children: [
          ProfileHeader(),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.fromLTRB(2, 20, 2, 15),
            child: Column(
=======
      appBar: AppBar(
        title: Text("Redefinir Senha"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              //alignment: Alignment.topLeft,
>>>>>>> Stashed changes
              children: [
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
