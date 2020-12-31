import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedRaisedButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const RoundedRaisedButton(
      {Key key, @required this.buttonText, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      color: Colors.transparent,
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: [
              Color(0xffe75e63),
              Color(0xffa637ac),
              Color(0xff7c1edc),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
