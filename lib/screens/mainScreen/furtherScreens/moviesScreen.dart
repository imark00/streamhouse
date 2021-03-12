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
    Movies.getActionMovies();
    Movies.getScienceFictionMovies();
    Movies.getHorrorMovies();
    Movies.getComedyMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _upcomingMoviesDisplay(),
          SizedBox(height: 8.0),
          _actionMoviesDisplay(),
          SizedBox(height: 8.0),
          _scienceFictionMoviesDisplay(),
          SizedBox(height: 8.0),
          _horrorMoviesDisplay(),
          SizedBox(height: 8.0),
          _comedyMoviesDisplay(),
          SizedBox(height: 8.0)
        ],
      ),
    );
  }

  Widget _upcomingMoviesDisplay() {
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

  Widget _actionMoviesDisplay() {
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
                  'Action',
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
              future: Movies.getActionMovies(),
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
                              image: Movies.actionMovies.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(Movies
                                          .actionMovies[index]['poster_path']),
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

  Widget _scienceFictionMoviesDisplay() {
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
                  'Sci-Fi',
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
              future: Movies.getScienceFictionMovies(),
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
                              image: Movies.scienceFiction.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          Movies.scienceFiction[index]
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

  Widget _horrorMoviesDisplay() {
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
                  'Horror',
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
              future: Movies.getHorrorMovies(),
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
                              image: Movies.horrorMovies.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(Movies
                                          .horrorMovies[index]['poster_path']),
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

  Widget _comedyMoviesDisplay() {
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
                  'Comedy',
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
              future: Movies.getComedyMovies(),
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
                              image: Movies.comedyMovies.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(Movies
                                          .comedyMovies[index]['poster_path']),
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
