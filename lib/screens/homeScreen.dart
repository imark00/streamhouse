import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/signInScreen.dart';
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
              child: Text('create an account'),
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
            ),
            RaisedButton(
              child: Text('sign in!!!'),
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
