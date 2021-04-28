import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/profile/profile_bloc.dart';
import '../core/loading.dart';
import '../core/ui.dart';
import 'components/background_image.dart';
import 'components/perfil_image.dart';
import 'components/profile_form.dart';
import 'components/right_side_text.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(user: user)..add(ScreenStarded()),
      child: ProfileScreenPage(),
    );
  }
}

class ProfileScreenPage extends StatefulWidget {
  @override
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  ProfileBloc profileBloc;

  @override
  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    profileBloc = BlocProvider.of<ProfileBloc>(context);

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
              name: profileBloc.userInfo.nome,
              acumulatedHours:
                  'Horas acumuladas: ${profileBloc.userInfo.horas}',
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (contextListener, state) {
                if (state is SuccessState) {
                  buildSnackBarUi(contextListener, state.message);
                } else if (state is FailState) {
                  buildSnackBarUi(contextListener, state.message);
                }
              },
              child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return Loading();
                } else {
                  return ProfileForm(
                      hintEmail: profileBloc.userInfo.email,
                      hintName: profileBloc.userInfo.nome,
                      redefinePassword: () {
                        profileBloc.add(SendPasswordRecover());
                      });
                }
              }),
            ),
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
