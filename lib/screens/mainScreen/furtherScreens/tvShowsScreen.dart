import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/screens/movieDetailsScreen/movieDetailsScreen.dart';
import 'package:stream_house/services/networking.dart';

class TvShowsScreen extends StatefulWidget {
  @override
  _TvShowsScreenState createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  @override
  void initState() {
    TVShows.getAiringTodayTVShows();
    TVShows.getOnTheAirTVShows();
    TVShows.getDramaTVShows();
    TVShows.getRomanceTVShows();
    TVShows.getScienceFictionTVShows();
    TVShows.getComedyTVShows();
    TVShows.getAnimationTVShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _airingTodayTVShowsDisplay(),
          SizedBox(height: 8.0),
          _onTheAirTVShowsDisplay(),
          SizedBox(height: 8.0),
          _dramaTVShowsDisplay(),
          SizedBox(height: 8.0),
          _romanceTVShowsDisplay(),
          SizedBox(height: 8.0),
          _scienceFictionTVShowsDisplay(),
          SizedBox(height: 8.0),
          _comedyTVShowsDisplay(),
          SizedBox(height: 8.0),
          _animationTVShowsDisplay(),
          SizedBox(height: 8.0)
        ],
      ),
    );
  }

  Widget _airingTodayTVShowsDisplay() {
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
                  'Airing Today',
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
                            Navigator.pushNamed(context, MovieDetailsScreen.id);
                          },
                          child: Container(
                            width: 120.0,
                            margin: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white38,
                              ),
                              image: DecorationImage(
                                image: TVShows.airingTodayTVShows.length == null
                                    ? AssetImage(
                                        'assets/icons/logoTransparent.png')
                                    : NetworkImage(
                                        portraitImagePath(
                                            TVShows.airingTodayTVShows[index]
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

  Widget _onTheAirTVShowsDisplay() {
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
                  'On The Air',
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
              future: TVShows.getOnTheAirTVShows(),
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
                              image: TVShows.onTheAirTVShows.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          TVShows.onTheAirTVShows[index]
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

  Widget _dramaTVShowsDisplay() {
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
                  'Drama',
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
              future: TVShows.getDramaTVShows(),
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
                              image: TVShows.dramaTVShows.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(TVShows
                                          .dramaTVShows[index]['poster_path']),
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

  Widget _romanceTVShowsDisplay() {
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
                  'Romance',
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
              future: TVShows.getRomanceTVShows(),
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
                              image: TVShows.romanceTVShows.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          TVShows.romanceTVShows[index]
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

  Widget _scienceFictionTVShowsDisplay() {
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
              future: TVShows.getScienceFictionTVShows(),
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
                              image: TVShows.scienceFictionTVShows.length ==
                                      null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          TVShows.scienceFictionTVShows[index]
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

  Widget _comedyTVShowsDisplay() {
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
              future: TVShows.getComedyTVShows(),
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
                              image: TVShows.comedyTVShows.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(TVShows
                                          .comedyTVShows[index]['poster_path']),
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

  Widget _animationTVShowsDisplay() {
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
                  'Animation',
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
              future: TVShows.getAnimationTVShows(),
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
                              image: TVShows.animationTVShows.length == null
                                  ? AssetImage(
                                      'assets/icons/logoTransparent.png')
                                  : NetworkImage(
                                      portraitImagePath(
                                          TVShows.animationTVShows[index]
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
