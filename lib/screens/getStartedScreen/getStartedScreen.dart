import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/responsive/orientationLayout.dart';
import 'package:stream_house/responsive/screenTypeLayout.dart';

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
    // var _mediaQuery = MediaQuery.of(context).size;
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
              padding:
                  const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/logoTransparent.png',
                        scale: 6.0,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        'streamhouse',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 23.0,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0.0),
                    autofocus: true,
                    splashColor: Color(0xffa637ac),
                    onPressed: () {
                      print('pressed');
                      //todo: navigate to signIn screen
                    },
                    child: Text(
                      "sign in",
                      style: TextStyle(fontSize: 23.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 10.0),
                  child: Text(
                    'Stream and download all your movies and tc shows with no hustle',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //todo: navigate
                  },
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text("sign up"),
                  ),
                )
                // Container(
                //   padding: EdgeInsets.all(0),
                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //     // gradient: LinearGradient(
                //     //   colors: [
                //     //     Color(0xff7c1edc),
                //     //     Color(0xffe75e63),
                //     //     Color(0xffa637ac),
                //     //   ],
                //     // ),
                //   ),
                //   child: RaisedButton(
                //     onPressed: () {
                //       //todo: navigate to signUp screen
                //     },
                //     color: Colors.transparent,
                //     child: Text(
                //       "sign up",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            )
            // Align(
            //   alignment: Alignment.bottomCenter,
            // ),
          ],
        ),
      ),
    );
  }
}

// Color(0xff7c1edc),
// Color(0xffe75e63)
// Color(0xffa637ac),
