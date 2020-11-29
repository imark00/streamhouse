import 'package:flutter/material.dart';
import 'package:stream_house/responsive/orientationLayout.dart';
import 'package:stream_house/responsive/screenTypeLayout.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedScreen extends StatelessWidget {
  static const String id = 'GetStartedScreen';
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => GetStartedScreenMobilePortrait(),
        //landscape:
        //todo: build the landscape layout
      ),
      tablet: OrientationLayout(
        //landscape:
        //todo: build the landscape layout
        portrait: (context) {
          return;
        },
      ),
    );
  }
}

class GetStartedScreenMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/moviePosterPortrait.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: Colors.transparent.withOpacity(0.8),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/logo.png',
                        //scale: 10.0,
                        width: 50.0,
                      ),
                      Text(
                        'StreamHouse',
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
