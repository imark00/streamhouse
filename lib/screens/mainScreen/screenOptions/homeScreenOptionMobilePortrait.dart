import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/screens/mainScreen/furtherScreens/homeScreen.dart';
import 'package:stream_house/screens/mainScreen/furtherScreens/moviesScreen.dart';
import 'package:stream_house/screens/mainScreen/furtherScreens/tvShowsScreen.dart';

class HomeScreenOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff063048),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff0d2e41),
          bottom: PreferredSize(
            preferredSize: Size(0.0, 0.0),
            child: TabBar(
              indicatorColor: Color(0xffa637ac),
              tabs: [
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: "Movies",
                ),
                Tab(
                  text: "TV Shows",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            MoviesScreen(),
            TvShowsScreen(),
          ],
        ),
      ),
    );
  }
}
