import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/widgets/display.dart';
import 'package:stream_house/screens/movieDetailsScreen/movieDetailsScreen.dart';
import 'package:stream_house/services/networking.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String movieId;
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
          Display(
            categoryTitle: 'Trending Movies',
            fetchData: FutureBuilder(
                future: TrendingMovies.getTrendingMovies(),
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
                              widget.movieId = TrendingMovies
                                  .trendingMovies[index]['id']
                                  .toString();
                              print(widget.movieId);
                              Navigator.pushNamed(
                                context,
                                MovieDetailsScreen.id,
                                arguments: widget.movieId,
                              );
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TrendingMovies
                                    .trendingMovies[index]['poster_path']),
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Colors.white,
                                    height: 200.0,
                                    width: 120,
                                    //color: Color(0xff063048),
                                  ),
                                  baseColor: Color(0xff063048),
                                  highlightColor: Colors.grey.withOpacity(0.0),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white38),
                              ),
                              width: 120,
                              margin: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: Color(0xff063048),
                    highlightColor: Colors.grey.withOpacity(0.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      color: Colors.white,
                      height: 200.0,
                      width: double.infinity,
                      //color: Color(0xff063048),
                    ),
                  );
                }),
          ),
          SizedBox(height: 8.0),
          Display(
            categoryTitle: 'Trending TV Shows',
            fetchData: FutureBuilder(
              future: TrendingTVShows.getTrendingTVShows(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print(TrendingTVShows.trendingTVShows[index]['id']);
                            Navigator.pushNamed(context, MovieDetailsScreen.id);
                          },
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: portraitImagePath(TrendingTVShows
                                  .trendingTVShows[index]['poster_path']),
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Shimmer.fromColors(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  color: Colors.white,
                                  height: 200.0,
                                  width: 120,
                                  //color: Color(0xff063048),
                                ),
                                baseColor: Color(0xff063048),
                                highlightColor: Colors.grey.withOpacity(0.0),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38),
                            ),
                            width: 120,
                            margin: EdgeInsets.only(left: 10.0),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Shimmer.fromColors(
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    color: Colors.white,
                    height: 200.0,
                    width: double.infinity,
                    //color: Color(0xff063048),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8.0),
          Display(
            categoryTitle: 'Top Rated Movies',
            fetchData: FutureBuilder(
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
                              Navigator.pushNamed(
                                  context, MovieDetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(Movies
                                    .topRatedMovies[index]['poster_path']),
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Colors.white,
                                    height: 200.0,
                                    width: 120,
                                    //color: Color(0xff063048),
                                  ),
                                  baseColor: Color(0xff063048),
                                  highlightColor: Colors.grey.withOpacity(0.0),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white38),
                              ),
                              width: 120,
                              margin: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: Color(0xff063048),
                    highlightColor: Colors.grey.withOpacity(0.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      color: Colors.white,
                      height: 200.0,
                      width: double.infinity,
                      //color: Color(0xff063048),
                    ),
                  );
                }),
          ),
          SizedBox(height: 8.0),
          Display(
            categoryTitle: 'Top Rated TV Shows',
            fetchData: FutureBuilder(
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
                              Navigator.pushNamed(
                                  context, MovieDetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TVShows
                                    .topRatedTVShows[index]['poster_path']),
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Colors.white,
                                    height: 200.0,
                                    width: 120,
                                    //color: Color(0xff063048),
                                  ),
                                  baseColor: Color(0xff063048),
                                  highlightColor: Colors.grey.withOpacity(0.0),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white38),
                              ),
                              width: 120,
                              margin: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: Color(0xff063048),
                    highlightColor: Colors.grey.withOpacity(0.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      color: Colors.white,
                      height: 200.0,
                      width: double.infinity,
                      //color: Color(0xff063048),
                    ),
                  );
                }),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

String portraitImagePath(String path) {
  return "https://image.tmdb.org/t/p/original/$path";
}
