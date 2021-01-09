import 'package:flutter/material.dart';
import 'package:stream_house/responsive/orientationLayout.dart';
import 'package:stream_house/responsive/screenTypeLayout.dart';

import 'SignInScreenMobilePortrait.dart';

class SignInScreen extends StatelessWidget {
  static const String id = 'SignInScreen';
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => SignInScreenMobilePortrait(),
        landscape: (context) {
          //todo: build the landscape mobile layout
          return Container(
            color: Colors.yellow,
          );
        },
      ),
      tablet: OrientationLayout(
        landscape: (context) {
          //todo: build the landscape tablet layout
          return Container(
            color: Colors.yellow,
          );
        },
        portrait: (context) {
          //todo: build the portrait tablet layout
          return Container(
            color: Colors.green,
          );
        },
      ),
    );
  }
}
