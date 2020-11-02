import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/constants.dart';
import 'package:stream_house/screens/movieScreen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'SignInScreen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'enter your email',
                ),
                onChanged: (String userEmail) {
                  _email = userEmail.trimRight();
                },

                //email validation
                validator: (_email) {
                  //verifies if the entered email is empty
                  if (_email.isEmpty) {
                    return 'please enter email address';
                  }

                  //verifies if the entered email is a valid email
                  final bool emailValid =
                      RegExp(regExpPatternForEmail).hasMatch(_email);
                  if (emailValid == false) {
                    return 'invalid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'enter your password',
                ),
                obscureText: true,
                onChanged: (String userPassword) {
                  _password = userPassword;
                },

                //password validation
                validator: (_password) {
                  //verifies if the entered password is empty
                  if (_password.isEmpty) {
                    return 'please enter password';
                  }

                  return null;
                },
              ),
              RaisedButton(
                child: Text('continue'),
                onPressed: () async {
                  //if email and password are validated proceed to the Subscription Screen
                  if (_formKey.currentState.validate()) {
                    try {
                      final user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      if (user != null) {
                        Navigator.pushNamed(context, MovieScreen.id);
                      }
                    }
                    // if an error is caught during the sign in process, display invalid email or password to the user
                    on FirebaseAuthException catch (error) {
                      if (error.code == 'user-not-found' ||
                          error.code == 'wrong-password') {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('error!'),
                                content: Text(
                                  'invalid email or password',
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text('sure'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              );
                            });
                      }
                    }
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                child: Text(
                  'forgot password?',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  print('password forgotten');
                  //todo: 'create a screen for users that have forgotten their password'
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
