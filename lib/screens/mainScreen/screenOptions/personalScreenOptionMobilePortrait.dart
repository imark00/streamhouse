import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalScreenOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff063048),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff0d2e41),
          bottom: PreferredSize(
            preferredSize: Size(0.0, 20.0),
            child: TabBar(
              indicatorColor: Color(0xffa637ac),
              tabs: [
                Tab(
                  text: "Favorites",
                ),
                Tab(
                  text: "Downloads",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FavoriteScreen(),
            DownloadScreen(),
          ],
        ),
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Favorite files appear here",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Downloaded files appear here",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
