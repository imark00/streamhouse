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
      body: FutureBuilder(
        future: type == 'movie'
            ? Movie.getMovieDetails(id)
            : TVShow.getTVShowDetails(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (type == 'movie') {
              return MovieDetailsScreen(
                id: id,
              );
            } else {
              return TVShowDetailsScreen(
                id: id,
              );
            }
          }
          return detailsScreenShimmerEffect(context);
        },
      ),
    );
  }
}

Widget detailsScreenShimmerEffect(BuildContext context) => Column(
      children: [
        Shimmer.fromColors(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90.0),
              bottomRight: Radius.circular(90.0),
            ),
            child: Container(
              color: Colors.white,
              height: 280,
              width: double.infinity,
            ),
          ),
          baseColor: Color(0xff063048),
          highlightColor: Colors.grey.withOpacity(0.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                height: 180.0,
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      child: Container(
                        color: Colors.white,
                        height: 180,
                        width: 120,
                      ),
                      baseColor: Color(0xff063048),
                      highlightColor: Colors.grey.withOpacity(0.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Shimmer.fromColors(
                          child: Container(
                            color: Colors.white,
                            height: 20,
                            width: 150.0,
                          ),
                          baseColor: Color(0xff063048),
                          highlightColor: Colors.grey.withOpacity(0.0),
                        ),
                        Shimmer.fromColors(
                          child: Container(
                            color: Colors.white,
                            height: 20,
                            width: 150.0,
                          ),
                          baseColor: Color(0xff063048),
                          highlightColor: Colors.grey.withOpacity(0.0),
                        ),
                        Shimmer.fromColors(
                          child: Container(
                            color: Colors.white,
                            height: 20,
                            width: 150.0,
                          ),
                          baseColor: Color(0xff063048),
                          highlightColor: Colors.grey.withOpacity(0.0),
                        ),
                        Shimmer.fromColors(
                          child: Container(
                            color: Colors.white,
                            height: 20,
                            width: 150.0,
                          ),
                          baseColor: Color(0xff063048),
                          highlightColor: Colors.grey.withOpacity(0.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: double.infinity,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
