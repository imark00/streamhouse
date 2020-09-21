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
                decoration: InputDecoration(
                  labelText: 'enter your email',
                ),
                onChanged: (String userEmail) {
                  email = userEmail;
                },
                validator: (email) {
                  if (email.isEmpty) {
                    return 'please enter email address';
                  }
                  final bool emailValid = RegExp(
                          r"[a-z0-9]+([-+._][a-z0-9]+){0,2}@.*?(\.(a(?:[cdefgilmnoqrstuwxz]|ero|(?:rp|si)a)|b(?:[abdefghijmnorstvwyz]iz)|c(?:[acdfghiklmnoruvxyz]|at|o(?:m|op))|d[ejkmoz]|e(?:[ceghrstu]|du)|f[ijkmor]|g(?:[abdefghilmnpqrstuwy]|ov)|h[kmnrtu]|i(?:[delmnoqrst]|n(?:fo|t))|j(?:[emop]|obs)|k[eghimnprwyz]|l[abcikrstuvy]|m(?:[acdeghklmnopqrstuvwxyz]|il|obi|useum)|n(?:[acefgilopruz]|ame|et)|o(?:m|rg)|p(?:[aefghklmnrstwy]|ro)|qa|r[eosuw]|s[abcdeghijklmnortuvyz]|t(?:[cdfghjklmnoprtvwz]|(?:rav)?el)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])\b){1,2}")
                      .hasMatch(email);
                  if (emailValid == false) {
                    return 'invalid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'enter your password',
                ),
                obscureText: true,
                onChanged: (String userPassword) {
                  password = userPassword;
                },
                validator: (password) {
                  if (password.isEmpty) {
                    return 'please enter password';
                  }
                  final bool passwordValid = RegExp(
                          r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$')
                      .hasMatch(password);
                  if (passwordValid == false) {
                    return '*password must contain at least one number\n*at least one letter\n*must be more than 5 characters';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text('continue'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print('success');
                    Provider.of<User>(context, listen: false)
                        .updateEmail(email);
                    Provider.of<User>(context, listen: false)
                        .updatePassword(password);
                    Navigator.pushNamed(context, SubscriptionPlanScreen.id);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
