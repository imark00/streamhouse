import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/signInScreen.dart';
import 'package:stream_house/screens/subscriptionPlanScreen.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/constants.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email, _password;

  final _formKey = GlobalKey<FormState>();
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

                  /*verifies if the entered password meet the necessary requirements i.e
                    * must contain at least one number
                    * must contain at least one letter
                    * must be more than 5 characters*/
                  final bool passwordValid =
                      RegExp(regExpPatternForPassword).hasMatch(_password);
                  if (passwordValid == false) {
                    return '*password must contain at least one number\n'
                        '*at least one letter\n'
                        '*must be more than 5 characters';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text('continue'),
                onPressed: () {
                  //if email and password are validated proceed to the Subscription Screen
                  if (_formKey.currentState.validate()) {
                    Provider.of<UserModel>(context, listen: false)
                        .updateEmail(_email);
                    Provider.of<UserModel>(context, listen: false)
                        .updatePassword(_password);
                    Navigator.pushNamed(context, SubscriptionPlanScreen.id);
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text('already have an account? '),
                  GestureDetector(
                    child: Text(
                      'click here to sign in',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      print('clicked');
                      Navigator.of(context).pushNamed(SignInScreen.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
