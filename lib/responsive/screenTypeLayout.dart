import 'package:flutter/material.dart';
import 'package:stream_house/enums/deviceScreenType.dart';
import 'package:stream_house/responsive/responsiveBuilder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const ScreenTypeLayout({Key key, this.mobile, this.tablet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }
      return mobile;
    });
  }
}
