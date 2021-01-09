import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenMobilePortrait extends StatefulWidget {
  @override
  _HomeScreenMobilePortraitState createState() =>
      _HomeScreenMobilePortraitState();
}

class _HomeScreenMobilePortraitState extends State<HomeScreenMobilePortrait> {
  User loggedUser;

  @override
  void initState() {
    super.initState();
    showLoggedInUserEmail();
  }

  showLoggedInUserEmail() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff063048),
      // body: Text(
      //   loggedUser.email,
      //   style: TextStyle(color: Colors.amberAccent, fontSize: 50.0),
      // ),
    );
  }
}
