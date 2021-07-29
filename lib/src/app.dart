import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/user_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  final UserBloc bloc = UserBloc();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
              value: bloc,
              child: LoginScreen(),
            ),
        '/home': (context) => HomeScreen(),
        '/signup': (context) => HomeScreen(),
      },
    );
  }
}
