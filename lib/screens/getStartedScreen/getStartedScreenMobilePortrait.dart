import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/signInScreen/signInScreen.dart';
import 'package:stream_house/screens/signUpScreen/signUpScreen.dart';
import 'package:stream_house/widgets/roundedRaisedButton.dart';

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
                  const EdgeInsets.only(left: 11.0, right: 11.0, top: 10.0),
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
                        width: 5.0,
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
                    highlightColor: Color(0xffa637ac),
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.id);
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/icons/logoTransparent.png'),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Text(
                    'stream and download all your movies and tv shows with no hustle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: RoundedRaisedButton(
                  buttonText: "sign up",
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
