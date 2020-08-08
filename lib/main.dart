import 'package:flutter/material.dart';
import 'package:stream_house/screens/homeScreen.dart';
import 'package:stream_house/screens/signUpScreen.dart';

void main() => runApp(StartApp());

class StartApp extends StatelessWidget {
  final String title = 'StreamHouse';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen()
      },
    );
  }
}
