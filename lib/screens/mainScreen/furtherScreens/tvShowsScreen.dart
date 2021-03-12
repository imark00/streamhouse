import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/services/networking.dart';

class TvShowsScreen extends StatefulWidget {
  @override
  _TvShowsScreenState createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  @override
  void initState() {
    TVShows.getAiringTodayTVShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _airingTodayTVShowsDisplay(),
          SizedBox(height: 8.0),
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
                        itemBuilder: (context, index) => Container(
                          width: 120.0,
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
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
