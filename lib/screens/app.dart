import 'services/services.dart';
import 'welcome/welcome_screen.dart';

import '../blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Signup/signup_screen.dart';
import 'core/ui.dart';
import 'login/login_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    final GlobalKey<State> keyLoader = new GlobalKey<State>();
    authBloc = BlocProvider.of<AuthBloc>(context);
    UiBuilder uiBuilder = UiBuilder(keyLoader: keyLoader);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (contextListener, state) {
          if (state is AuthenticatedState) {
            if (state.user != null) {
              widget.setUser(state.user);
            }
          } else if (state is ExceptionState) {
            uiBuilder.buildSnackBarUi(context, state.message);
          } else if (state is ForgotState) {
            //navigateToForgotScreen(context);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is GoToHomeState) {
            return Services(
              authBloc: authBloc,
            );
          } else if (state is SignupState) {
            return SignUpScreen(
              authBloc: authBloc,
            );
          } else if (state is LoginState) {
            return LoginScreen(authBloc: authBloc);
          } else {
            return WelcomeScreen(authBloc: authBloc);
          }
        }),
      ),
    );
  }
}
