import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  static const String id = 'MovieScreen';

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
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
        // print(loggedUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
