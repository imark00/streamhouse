import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stream_house/screens/detailsScreen/detailsScreen.dart';
import 'package:stream_house/services/networking.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/widgets/display.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  // void initState() {
  //   Movies.getUpcomingMovies();
  //   Movies.getActionMovies();
  //   Movies.getScienceFictionMovies();
  //   Movies.getHorrorMovies();
  //   Movies.getComedyMovies();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    String id = '';
    String type = 'movie';
    return SingleChildScrollView(
      child: Column(
        children: [
          Display(
            categoryTitle: 'Upcoming',
            fetchData: FutureBuilder(
                future: Movies.getUpcomingMovies(),
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
                              Navigator.pushNamed(
                                context,
                                DetailsScreen.id,
                                arguments: [
                                  id = Movies.upcomingMovies[index]['id']
                                      .toString(),
                                  type,
                                ],
                              );
                              print(id);
                              print(type);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(Movies
                                    .upcomingMovies[index]['poster_path']),
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
            categoryTitle: 'Horror',
            fetchData: FutureBuilder(
                future: Movies.getHorrorMovies(),
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
                              Navigator.pushNamed(
                                context,
                                DetailsScreen.id,
                                arguments: [
                                  id = Movies.horrorMovies[index]['id']
                                      .toString(),
                                  type,
                                ],
                              );
                              print(id);
                              print(type);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(
                                    Movies.horrorMovies[index]['poster_path']),
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
            categoryTitle: 'Action',
            fetchData: FutureBuilder(
                future: Movies.getActionMovies(),
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
                              Navigator.pushNamed(
                                context,
                                DetailsScreen.id,
                                arguments: [
                                  id = Movies.actionMovies[index]['id']
                                      .toString(),
                                  type,
                                ],
                              );
                              print(id);
                              print(type);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(
                                    Movies.actionMovies[index]['poster_path']),
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
            categoryTitle: 'Comedy',
            fetchData: FutureBuilder(
                future: Movies.getComedyMovies(),
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
                              Navigator.pushNamed(
                                context,
                                DetailsScreen.id,
                                arguments: [
                                  id = Movies.comedyMovies[index]['id']
                                      .toString(),
                                  type,
                                ],
                              );
                              print(id);
                              print(type);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(
                                    Movies.comedyMovies[index]['poster_path']),
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
            categoryTitle: 'Sci-Fi',
            fetchData: FutureBuilder(
                future: Movies.getScienceFictionMovies(),
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
                              Navigator.pushNamed(
                                context,
                                DetailsScreen.id,
                                arguments: [
                                  id = Movies.scienceFiction[index]['id']
                                      .toString(),
                                  type,
                                ],
                              );
                              print(id);
                              print(type);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(Movies
                                    .scienceFiction[index]['poster_path']),
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
          SizedBox(height: 8.0)
        ],
      ),
    );
  }
}

String portraitImagePath(String path) {
  return "https://image.tmdb.org/t/p/original/$path";
}
