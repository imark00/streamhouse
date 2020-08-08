import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter password'),
            ),
            RaisedButton(
              child: Text('Sign Up'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
