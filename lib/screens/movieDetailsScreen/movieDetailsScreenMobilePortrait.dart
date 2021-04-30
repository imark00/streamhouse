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
    String movieId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xff063048),
      body: Container(
        child: Text(
          movieId,
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
