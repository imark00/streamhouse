import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/mainScreen/screenOptions/accountScreenOptionMobilePortrait.dart';
import 'package:stream_house/screens/mainScreen/screenOptions/homeScreenOptionMobilePortrait.dart';
import 'package:stream_house/screens/mainScreen/screenOptions/personalScreenOptionMobilePortrait.dart';
import 'package:stream_house/screens/mainScreen/screenOptions/searchScreenOptionMobilePortrait.dart';

class MainScreenMobilePortrait extends StatefulWidget {
  @override
  _MainScreenMobilePortraitState createState() =>
      _MainScreenMobilePortraitState();
}

class _MainScreenMobilePortraitState extends State<MainScreenMobilePortrait> {
  User loggedUser;
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _bottomBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
    BottomNavigationBarItem(icon: Icon(Icons.folder), label: "personal"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "account"),
  ];
  List<Widget> screenOptions = [
    Home(),
    Search(),
    PersonalScreenOption(),
    Account()
  ];

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
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff0d2e41),
        title: Text("StreamHouse"),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screenOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff0d2e41),
        unselectedItemColor: Colors.white70,
        fixedColor: Color(0xffe75e63),
        currentIndex: _currentIndex,
        onTap: _onPressed,
        items: _bottomBarItems,
      ),
    );
  }
}
