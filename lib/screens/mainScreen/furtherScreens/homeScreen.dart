import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_house/services/networking.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    TrendingMovies.getTrendingMovies();
    TrendingTVShows.getTrendingTVShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          moviesTrendingNow(),
          SizedBox(height: 8.0),
          tvShowsTrendingNow(),
        ],
      ),
    );
  }

  Widget moviesTrendingNow() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 20.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Movies Trending Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(0.0),
                splashColor: Colors.white12,
                child: Text(
                  "view more",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                onPressed: () {
                  print("view more");
                },
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: TrendingMovies.getTrendingMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            portraitImagePath(TrendingMovies
                                .trendingMovies[index]['poster_path']),
                          ),
                        ),
                      ),
                      width: 120,
                      margin: EdgeInsets.only(left: 10.0),
                    );
                  },
                ),
              );
            }
            return Text(
              'Loading',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            );
          },
        )
      ],
    );
  }

  Widget tvShowsTrendingNow() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 20.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TV Shows Trending Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(0.0),
                splashColor: Colors.white12,
                child: Text(
                  "view more",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                onPressed: () {
                  print("view more");
                },
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: TrendingTVShows.getTrendingTVShows(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            portraitImagePath(TrendingTVShows
                                .trendingTVShows[index]['poster_path']),
                          ),
                        ),
                      ),
                      width: 120,
                      margin: EdgeInsets.only(left: 10.0),
                    );
                  },
                ),
              );
            }
            return Text(
              'Loading',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            );
          },
        )
      ],
    );
  }

  String portraitImagePath(String path) {
    return "https://image.tmdb.org/t/p/original/$path";
  }
}
