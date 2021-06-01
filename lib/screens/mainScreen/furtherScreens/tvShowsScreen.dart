import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/screens/detailsScreen/detailsScreen.dart';
import 'package:stream_house/services/networking.dart';
import 'package:stream_house/widgets/display.dart';

class TvShowsScreen extends StatefulWidget {
  @override
  _TvShowsScreenState createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  @override
  // void initState() {
  //   TVShows.getAiringTodayTVShows();
  //   TVShows.getOnTheAirTVShows();
  //   TVShows.getDramaTVShows();
  //   TVShows.getMysteryTVShows();
  //   TVShows.getScienceFictionTVShows();
  //   TVShows.getComedyTVShows();
  //   TVShows.getAnimationTVShows();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Display(
            categoryTitle: 'Airing Today',
            fetchData: FutureBuilder(
                future: TVShows.getAiringTodayTVShows(),
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
                              print(TVShows.airingTodayTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TVShows
                                    .airingTodayTVShows[index]['poster_path']),
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
            categoryTitle: 'On The Air',
            fetchData: FutureBuilder(
                future: TVShows.getOnTheAirTVShows(),
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
                              print(TVShows.onTheAirTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TVShows
                                    .onTheAirTVShows[index]['poster_path']),
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
            categoryTitle: 'Drama',
            fetchData: FutureBuilder(
                future: TVShows.getDramaTVShows(),
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
                              print(TVShows.dramaTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(
                                    TVShows.dramaTVShows[index]['poster_path']),
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
            categoryTitle: 'Mystery',
            fetchData: FutureBuilder(
                future: TVShows.getMysteryTVShows(),
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
                              print(TVShows.mysteryTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TVShows
                                    .mysteryTVShows[index]['poster_path']),
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
                future: TVShows.getScienceFictionTVShows(),
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
                              print(TVShows.scienceFictionTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(
                                    TVShows.scienceFictionTVShows[index]
                                        ['poster_path']),
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
                future: TVShows.getComedyTVShows(),
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
                              print(TVShows.comedyTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TVShows
                                    .comedyTVShows[index]['poster_path']),
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Colors.white,
                                    height: 200.0,
                                    width: 120,
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
                    ),
                  );
                }),
          ),
          SizedBox(height: 8.0),
          Display(
            categoryTitle: 'Animation',
            fetchData: FutureBuilder(
                future: TVShows.getAnimationTVShows(),
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
                              print(TVShows.animationTVShows[index]['id']);
                              Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Container(
                              child: CachedNetworkImage(
                                imageUrl: portraitImagePath(TVShows
                                    .animationTVShows[index]['poster_path']),
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Colors.white,
                                    height: 200.0,
                                    width: 120,
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
