import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenMobilePortrait extends StatefulWidget {
  @override
  _MainScreenMobilePortraitState createState() =>
      _MainScreenMobilePortraitState();
}

class _MainScreenMobilePortraitState extends State<MainScreenMobilePortrait> {
  User loggedUser;
  int _currentIndex = 0;
  List<Widget> viewOptions = [Home(), Search(), Personal(), Account()];

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

  _onPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff063048),
      appBar: AppBar(
        backgroundColor: Color(0xff063048),
        centerTitle: true,
        title: Text(
          "streamhouse",
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: viewOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff063048),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: _currentIndex,
        onTap: _onPressed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "personal"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "account"),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Search",
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Personal",
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Account",
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }
}
