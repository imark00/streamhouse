import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  static const String id = 'MovieScreen';

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
