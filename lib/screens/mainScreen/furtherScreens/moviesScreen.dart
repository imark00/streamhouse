import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stream_house/services/networking.dart';
import 'package:shimmer/shimmer.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    Movies.getUpcomingMovies();
    Movies.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _upcomingMovies(),
          SizedBox(
            height: 8.0,
          ),
          _topRatedMovies(),
        ],
      ),
    );
  }

  Widget _upcomingMovies() {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    print('view more');
                  },
                  padding: EdgeInsets.all(0.0),
                  splashColor: Colors.white12,
                  child: Text(
                    'view more',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: Movies.getUpcomingMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          width: 120.0,
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Movies.upcomingMovies.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          Movies.upcomingMovies[index]
                                              ['poster_path']),
                                    ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text(
                    'Shimmer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  Widget _topRatedMovies() {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Rated',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    print('view more');
                  },
                  padding: EdgeInsets.all(0.0),
                  splashColor: Colors.white12,
                  child: Text(
                    'view more',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: Movies.getTopRatedMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          width: 120.0,
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Movies.topRatedMovies.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          Movies.topRatedMovies[index]
                                              ['poster_path']),
                                    ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text(
                    'Shimmer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  String portraitImagePath(String path) {
    return "https://image.tmdb.org/t/p/original/$path";
  }
}
