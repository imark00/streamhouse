import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/screens/movieDetailsScreen/movieDetailsScreen.dart';
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
    Movies.getTopRatedMovies();
    TVShows.getTopRatedTVShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          trendingMovies(),
          SizedBox(height: 8.0),
          trendingTVShows(),
          SizedBox(height: 8.0),
          _topRatedMovies(),
          SizedBox(height: 8.0),
          _topRatedTVShows(),
          SizedBox(height: 8.0)
        ],
      ),
    );
  }

  Widget trendingMovies() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 20.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending Movies",
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
                    return GestureDetector(
                      onTap: () {
                        print(TrendingMovies.trendingMovies[index]['id']);
                        Navigator.pushNamed(context, MovieDetailsScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white38),
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
                      ),
                    );
                  },
                ),
              );
            }
            return Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Text(
                'Loading',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget trendingTVShows() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 20.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending TV Shows",
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
                    return GestureDetector(
                      onTap: () {
                        print(TrendingTVShows.trendingTVShows[index]['id']);
                        Navigator.pushNamed(context, MovieDetailsScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white38),
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
                      ),
                    );
                  },
                ),
              );
            }
            return Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Text(
                'Loading',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        )
      ],
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
                  'Top Rated Movies',
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
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print(Movies.topRatedMovies[index]['id']);
                            Navigator.pushNamed(context, MovieDetailsScreen.id);
                          },
                          child: Container(
                            width: 120.0,
                            margin: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38),
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
                    ),
                  );
                }
                return Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text(
                    'Loading',
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

  Widget _topRatedTVShows() {
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
                  'Top Rated TV Shows',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('view more');
                  },
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
              future: TVShows.getTopRatedTVShows(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print(TVShows.topRatedTVShows[index]['id']);
                            Navigator.pushNamed(context, MovieDetailsScreen.id);
                          },
                          child: Container(
                            width: 120.0,
                            margin: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38),
                              image: DecorationImage(
                                image: TVShows.topRatedTVShows.length == null
                                    ? AssetImage(
                                        'assets/icons/logoTransparent.png')
                                    : NetworkImage(
                                        portraitImagePath(
                                            TVShows.topRatedTVShows[index]
                                                ['poster_path']),
                                      ),
                                fit: BoxFit.fill,
                              ),
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
                    'Loading',
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
