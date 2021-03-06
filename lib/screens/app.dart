import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';
import 'Signup/signup_screen.dart';
import 'core/ui.dart';
import 'forgot_password/forgot_password_screen.dart';
import 'login/login_screen.dart';
import 'register_questionary/questionary_screen.dart';
import 'services/services.dart';
import 'welcome/welcome_screen.dart';
import '../resources/messaging/fcm_messaging.dart';

class App extends StatelessWidget {
  final Function setUser;

  App({@required this.setUser});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AppStartedEvent()),
      child: AppPage(
        setUser: setUser,
      ),
    );
  }
}

class AppPage extends StatefulWidget {
  final Function setUser;

  AppPage({@required this.setUser});

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  AuthBloc authBloc;

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  setMessaging(BuildContext context) async {
    await init(context);
  }

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (contextListener, state) {
          if (state is AuthenticatedState) {
            if (state.user != null) {
              widget.setUser(state.user, state.userModel);
              setMessaging(context);
            }
          } else if (state is ExceptionState) {
            buildSnackBarUi(context, state.message);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthenticatedState) {
            return Services(
              authBloc: authBloc,
            );
          } else if (state is QuestionaryState) {
            return QuestionaryScreen(
              authBloc: authBloc,
            );
          } else if (state is SignupState) {
            return SignUpScreen(
              authBloc: authBloc,
            );
          } else if (state is LoginState) {
            return LoginScreen(authBloc: authBloc);
          } else if (state is ForgotState) {
            return ForgotPasswordScreen(authBloc: authBloc);
          } else {
            return WelcomeScreen(authBloc: authBloc);
          }
        }),
      ),
    );
  }
}
