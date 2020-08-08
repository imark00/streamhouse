import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/signUpScreen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'StreamHouse',
                style: TextStyle(fontSize: 25.0),
              ),
              RaisedButton(
                child: Text('Tap Here to Sign Up!!!'),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
              )
            ]),
      ),
    );
  }
}
