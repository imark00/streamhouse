import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/homeScreen/homeScreen.dart';
import 'package:stream_house/constants.dart';
import 'package:stream_house/screens/signUpScreen/signUpScreen.dart';
import 'package:stream_house/widgets/roundedRaisedButton.dart';

class SignInScreenMobilePortrait extends StatefulWidget {
  @override
  _SignInScreenMobilePortraitState createState() =>
      _SignInScreenMobilePortraitState();
}

class _SignInScreenMobilePortraitState
    extends State<SignInScreenMobilePortrait> {
  String _email, _password;
  final _formKey = GlobalKey<FormState>();
  bool _showLoader = false;
  bool _showPassword = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "streamhouse",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _showLoader,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Color(0xffa637ac),
          strokeWidth: 5.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image(
                  image: AssetImage(
                    'assets/icons/logoTransparent.png',
                  ),
                  height: 150.0,
                ),
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
                            "sign in",
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
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  cursorColor: Color(0xffa637ac),
                                  cursorHeight: 28.0,
                                  decoration: InputDecoration(
                                    labelText: 'email',
                                    labelStyle: TextStyle(
                                      fontSize: 23.0,
                                      color: Color(0xffa637ac),
                                    ),
                                    errorStyle: TextStyle(fontSize: 15.0),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffa637ac),
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffa637ac),
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
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  cursorHeight: 28.0,
                                  cursorColor: Color(0xff7c1edc),
                                  obscureText: !_showPassword,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 15.0),
                                    labelText: 'password',
                                    labelStyle: TextStyle(
                                      fontSize: 23.0,
                                      color: Color(0xff7c1edc),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                      child: Icon(
                                        _showPassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xff7c1edc),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff7c1edc),
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff7c1edc),
                                      ),
                                    ),
                                  ),

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
                                SizedBox(
                                  height: 30.0,
                                ),
                                Consumer<UserModel>(
                                  builder: (context, userInfo, _) {
                                    return RoundedRaisedButton(
                                      buttonText: "done",
                                      onPressed: () async {
                                        //if email and password are validated proceed to the HomeScreen
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          setState(() {
                                            _showLoader = true;
                                          });
                                          Provider.of<UserModel>(context,
                                                  listen: false)
                                              .updateEmail(_email);
                                          Provider.of<UserModel>(context,
                                                  listen: false)
                                              .updatePassword(_password);
                                          try {
                                            final user = await _auth
                                                .signInWithEmailAndPassword(
                                                    email: userInfo.email,
                                                    password:
                                                        userInfo.password);
                                            if (user != null) {
                                              setState(
                                                () {
                                                  _showLoader = false;
                                                  Navigator.pushNamed(
                                                      context, HomeScreen.id);
                                                },
                                              );
                                            }
                                          } on FirebaseAuthException catch (error) {
                                            setState(() {
                                              _showLoader = false;
                                            });
                                            if (error.code ==
                                                    'user-not-found' ||
                                                error.code ==
                                                    'wrong-password') {
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                GestureDetector(
                                  child: Text(
                                    'forgot password?',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                      color: Color(0xff7c1edc),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    //todo: 'create a screen for users that have forgotten their password'
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                GestureDetector(
                                  child: Text(
                                    'create an account',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                      color: Color(0xff7c1edc),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.pushReplacementNamed(
                                        context, SignUpScreen.id);
                                  },
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
      ),
    );
  }
}
