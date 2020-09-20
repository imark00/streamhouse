import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/subscriptionPlanScreen.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter email'),
              onChanged: (String userEmail) {
                email = userEmail;
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Enter password'),
              onChanged: (String userPassword) {
                password = userPassword;
              },
            ),
            RaisedButton(
              child: Text('continue'),
              onPressed: () {
                Provider.of<User>(context, listen: false).updateEmail(email);
                Provider.of<User>(context, listen: false)
                    .updatePassword(password);
                Navigator.pushNamed(context, SubscriptionPlanScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

//              onPressed: () async {
//                try {
//                  final newUser = await FirebaseAuth.instance
//                      .createUserWithEmailAndPassword(
//                          email: user.getEmail(), password: user.getPassword());
//                  if (newUser != null) {
//                    Navigator.pushNamed(context, routeName);
//                  }
//                } catch (error) {
//                  print(error);
//                }
//              },
