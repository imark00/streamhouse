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
    var _mediaQuery = MediaQuery.of(context).size;
    return RaisedButton(
      elevation: 0.0,
      color: Colors.transparent,
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffa637ac),
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xffe75e63),
          //     Color(0xffa637ac),
          //     Color(0xff7c1edc),
          //   ],
          // ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: _mediaQuery.width * 0.15,
            vertical: _mediaQuery.height * 0.01),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: _mediaQuery.width * 0.08, color: Colors.white),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
