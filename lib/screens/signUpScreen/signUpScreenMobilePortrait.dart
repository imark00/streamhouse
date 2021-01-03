import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/homeScreen/homeScreen.dart';
import 'package:stream_house/screens/signInScreen/signInScreen.dart';
import 'package:stream_house/widgets/roundedRaisedButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../constants.dart';

class SignUpScreenMobilePortrait extends StatefulWidget {
  @override
  _SignUpScreenMobilePortraitState createState() =>
      _SignUpScreenMobilePortraitState();
}

class _SignUpScreenMobilePortraitState
    extends State<SignUpScreenMobilePortrait> {
  String _email, _password, _name;
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  bool _showLoader = false;
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
                                  cursorColor: Color(0xffe75e63),
                                  cursorHeight: 28.0,
                                  decoration: InputDecoration(
                                    labelText: 'name',
                                    labelStyle: TextStyle(
                                      fontSize: 23.0,
                                      color: Color(0xffe75e63),
                                    ),
                                    errorStyle: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffe75e63),
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffe75e63),
                                      ),
                                    ),
                                  ),
                                  onChanged: (String userName) {
                                    _name = userName.trimRight();
                                  },

                                  //name validation

                                  validator: (_name) {
                                    //verifies if the entered name is empty
                                    if (_name.isEmpty) {
                                      return 'please enter name';
                                    }
                                    return null;
                                  },
                                ),
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
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 15.0),
                                    labelText: 'password',
                                    labelStyle: TextStyle(
                                      fontSize: 23.0,
                                      color: Color(0xff7c1edc),
                                    ),
                                    suffixIcon: GestureDetector(
                                      child: Icon(
                                        _showPassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xff7c1edc),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
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
                                  obscureText: !_showPassword,
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
                                      return 'must contain at least one number\n'
                                          'must contain at least one letter\n'
                                          'must contain more than 5 characters';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Consumer<UserModel>(
                                  builder: (context, user, _) {
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
                                              .updateName(_name);
                                          Provider.of<UserModel>(context,
                                                  listen: false)
                                              .updateEmail(_email);
                                          Provider.of<UserModel>(context,
                                                  listen: false)
                                              .updatePassword(_password);
                                          try {
                                            final newUser = await _auth
                                                .createUserWithEmailAndPassword(
                                                    email: user.email,
                                                    password: user.password);
                                            if (newUser != null) {
                                              setState(() {
                                                _showLoader = false;
                                              });
                                              Navigator.pushNamed(
                                                  context, HomeScreen.id);
                                            }
                                          } on FirebaseAuthException catch (error) {
                                            setState(() {
                                              _showLoader = false;
                                            });
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text('error!'),
                                                  content: Text(
                                                    error.message,
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text('sure'),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'already have an account? ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'sign in here',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontStyle: FontStyle.italic,
                                            color: Color(0xff7c1edc),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  SignInScreen.id);
                                        },
                                      ),
                                    ],
                                  ),
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
