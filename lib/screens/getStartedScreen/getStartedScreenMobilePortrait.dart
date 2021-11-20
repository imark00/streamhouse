import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/signInScreen/signInScreen.dart';
import 'package:stream_house/screens/signUpScreen/signUpScreen.dart';
import 'package:stream_house/widgets/roundedRaisedButton.dart';

class GetStartedScreenMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/logoTransparent.png',
                            width: _mediaQuery.width * 0.1,
                          ),
                          SizedBox(
                            width: _mediaQuery.width * 0.05,
                          ),
                          Text(
                            'streamhouse',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: _mediaQuery.width * 0.05,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.id);
                        },
                        child: Text(
                          'sign in',
                          style: TextStyle(
                            fontSize: _mediaQuery.width * 0.05,
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0.0),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height * 0.1,
                ),
                Image(
                  image: AssetImage('assets/icons/logoTransparent.png'),
                  alignment: Alignment.center,
                  height: _mediaQuery.height / 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _mediaQuery.width * 0.05),
                  child: Text(
                    'stream and download all your movies and tv shows with no hustle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: _mediaQuery.width * 0.07,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedRaisedButton(
                      buttonText: 'sign up',
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
