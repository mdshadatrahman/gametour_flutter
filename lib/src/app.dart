import 'package:flutter/material.dart';
import 'package:gametour/src/screens/login.dart';
import 'package:gametour/src/screens/signInMethods.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gametour',
      theme: ThemeData(
        accentColor: Colors.orange,
        primaryColor: Colors.blue,
      ),
      home: SignInMethods(),
    );
  }
}
