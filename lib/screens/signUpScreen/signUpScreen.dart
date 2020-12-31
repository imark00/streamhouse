import 'package:flutter/material.dart';
import 'package:stream_house/responsive/orientationLayout.dart';
import 'package:stream_house/responsive/screenTypeLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:stream_house/screens/signInScreen.dart';
import 'package:stream_house/screens/subscriptionPlanScreen.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/constants.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = 'SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => SignUpScreenMobilePortrait(),
        landscape: (context) {
          //todo: build the landscape mobile layout
          return Container(
            color: Colors.yellow,
          );
        },
      ),
      tablet: OrientationLayout(
        landscape: (context) {
          //todo: build the landscape tablet layout
          return Container(
            color: Colors.yellow,
          );
        },
        portrait: (context) {
          //todo: build the portrait tablet layout
          return Container(
            color: Colors.yellow,
          );
        },
      ),
    );
  }
}

class SignUpScreenMobilePortrait extends StatefulWidget {
  @override
  _SignUpScreenMobilePortraitState createState() =>
      _SignUpScreenMobilePortraitState();
}

class _SignUpScreenMobilePortraitState
    extends State<SignUpScreenMobilePortrait> {
  String _email, _password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff063048),
      appBar: AppBar(
        backgroundColor: Color(0xff063048),
        elevation: 20.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          color: Colors.white,
          splashRadius: 20.0,
          onPressed: () {
            // Navigator.pop(context);
            print("tapped");
          },
        ),
        centerTitle: true,
        title: Text(
          "streamhouse",
          style: TextStyle(fontSize: 25.0),
        ),
        // title: Image(
        //   image: AssetImage(
        //     'assets/icons/logoTransparent.png',
        //   ),
        //   height: 50.0,
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage(
                  'assets/icons/logoTransparent.png',
                ),
                height: 150.0,
              ),
              // child: Text(
              //   'streamhouse',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 46.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(65.0),
                  topRight: Radius.circular(65.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(65.0),
                  topRight: Radius.circular(65.0),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, top: 15.0, right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign up",
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'email',
                                  labelStyle: TextStyle(
                                    fontSize: 23.0,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff063048),
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff063048),
                                    ),
                                  ),
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
                                      RegExp(regExpPatternForEmail)
                                          .hasMatch(_email);
                                  if (emailValid == false) {
                                    return 'invalid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.0),
                              TextFormField(
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
                                      RegExp(regExpPatternForPassword)
                                          .hasMatch(_password);
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
                                    Provider.of<UserModel>(context,
                                            listen: false)
                                        .updateEmail(_email);
                                    Provider.of<UserModel>(context,
                                            listen: false)
                                        .updatePassword(_password);
                                    Navigator.pushNamed(
                                        context, SubscriptionPlanScreen.id);
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
                                      Navigator.of(context)
                                          .pushNamed(SignInScreen.id);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
