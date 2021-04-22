import '../../core/validations.dart';

import '../../blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';

import '../../core/models/user_model.dart';
import 'components/background_image.dart';
import 'components/perfil_image.dart';
import 'components/profile_form.dart';
import 'components/right_side_text.dart';

class ProfileScreen extends StatelessWidget {
  final AuthBloc authBloc;
  final UserModel userModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ProfileScreen({Key key, this.userModel, this.authBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                BackgroundImage(),
                PerfilImage(),
              ],
            ),
            RightTextProfile(
              name: userModel.nome,
              acumulatedHours: 'Horas acumuladas: ${userModel.horas}',
            ),
            ProfileForm(
                hintEmail: userModel.email,
                hintName: userModel.nome,
                redefinePassword: () {
                  if (validateAndSave(formKey)) {
                    authBloc
                        .add(RequestNewPasswordEvent(email: userModel.email));
                  }
                }),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 4,
              endIndent: 100,
              indent: 100,
            ),
          ],
        ),
      ),
    );
  }
}
