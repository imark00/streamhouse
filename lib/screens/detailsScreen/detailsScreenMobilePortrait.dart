import 'package:stream_house/screens/detailsScreen/movieDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/screens/detailsScreen/tvShowDetailsScreen.dart';
import 'package:stream_house/services/networking.dart';

class DetailsScreenMobilePortrait extends StatefulWidget {
  @override
  _DetailsScreenMobilePortraitState createState() =>
      _DetailsScreenMobilePortraitState();
}

class _DetailsScreenMobilePortraitState
    extends State<DetailsScreenMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;

    String id = args[0];
    String type = args[1];

    return Scaffold(
      backgroundColor: Color(0xff063048),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: type == 'movie'
            ? Movie.getMovieDetails(id)
            : TVShow.getTVShowDetails(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (type == 'movie') {
              return MovieDetailsScreen();
            } else {
              return TVShowDetailsScreen();
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
