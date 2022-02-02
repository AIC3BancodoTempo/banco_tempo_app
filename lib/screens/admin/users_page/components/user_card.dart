import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/resources/fotos/FotosPerfil.dart';
import 'package:banco_do_tempo_app/screens/admin/users_profile/users_profile.dart';
import 'package:banco_do_tempo_app/screens/core/colors.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfile(
                          user: this.user,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          barrierDismissible: true,
                          opaque: false,
                          pageBuilder: (_, __, ___) =>
                              FullscreenImage(foto: this.user.foto)));
                    },
                    child: CircleAvatar(
                      backgroundImage: this.user.foto != ""
                          ? NetworkImage(this.user.foto)
                          : AssetImage("assets/images/profile.png"),
                      radius: 32,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(this.user.nome,
                            style: TextStyle(
                                fontSize: 19,
                                color: themeColor,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: themeColor),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Center(
                          child: Text(this.user.horas.toString() + " HORAS",
                              style:
                                  TextStyle(fontSize: 19, color: themeColor))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 10,
        )
      ],
    );
  }
}
