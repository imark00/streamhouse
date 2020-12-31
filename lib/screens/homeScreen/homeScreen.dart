import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'MovieScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
