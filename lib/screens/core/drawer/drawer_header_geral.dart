import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:flutter/material.dart';

class DrawerHeaderGeral extends StatelessWidget {
  final UserModel userModel;

  const DrawerHeaderGeral({Key key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        userModel.nome,
        style: TextStyle(fontSize: 18),
      ),
      accountEmail: Text('Horas acumuladas: ${userModel.horas}'),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.network(
            'https://i.stack.imgur.com/l60Hf.png',
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://venngage-wordpress.s3.amazonaws.com/uploads/2018/09/Simple-Purple-Checked-Background-Image.jpg')),
      ),
    );
  }
}
