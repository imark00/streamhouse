import 'package:flutter/material.dart';

class MovieDetailsScreenMobilePortrait extends StatefulWidget {
  @override
  _MovieDetailsScreenMobilePortraitState createState() =>
      _MovieDetailsScreenMobilePortraitState();
}

class _MovieDetailsScreenMobilePortraitState
    extends State<MovieDetailsScreenMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Text(
          'The serious business is about to start \n-Dembele',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
