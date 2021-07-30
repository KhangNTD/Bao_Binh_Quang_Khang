import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/src/screens/signup_screen.dart';

import 'blocs/user_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  final UserBloc bloc = UserBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
              value: bloc,
              child: LoginScreen(),
            ),
            '/sign-up': (context) => BlocProvider.value(
              value: bloc,
              child: SignUpScreen(),
            ),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
