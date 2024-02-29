import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_state.dart';
import 'package:tobeto_new/blocs/profile/profile_state.dart';
import 'package:tobeto_new/screens/home_screen.dart';
import 'package:tobeto_new/screens/login_screen/login_screen.dart';
import 'package:tobeto_new/screens/profile_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        return HomeScreen();
      }
      if (state is AuthLoggedOut) {
        return LoginScreen();
      }
      if (state is InformationState) {
        return HomeScreen();
      }

      return LoginScreen();
    });
  }
}
