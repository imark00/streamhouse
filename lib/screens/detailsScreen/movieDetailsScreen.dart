import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/videoPlayerScreen/videoPlayerScreen.dart';
import 'package:stream_house/services/networking.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:stream_house/screens/detailsScreen/detailsScreen.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool showLoader = false;
  bool subscribed;
  PaymentMethods obj = PaymentMethods();

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserModel>(context).email;
    String id = '';
    String type = 'movie';
    return ModalProgressHUD(
      inAsyncCall: showLoader,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Color(0xffa637ac),
        strokeWidth: 5.0,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imagePath(Movie.movieDetails['poster_path']),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 9.0),
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 435,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90.0),
                          bottomRight: Radius.circular(90.0),
                        ),
                        child: Container(
                          height: 280.0,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90.0),
                              bottomRight: Radius.circular(90.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imagePath(
                                Movie.movieDetails['backdrop_path'],
                              ),
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Shimmer.fromColors(
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
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 230,
                        left: 20.0,
                        child: Container(
                          height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            child: CachedNetworkImage(
                              imageUrl: imagePath(
                                Movie.movieDetails['poster_path'],
                              ),
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Shimmer.fromColors(
                                child: Container(
                                  height: 200,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                                baseColor: Color(0xff063048),
                                highlightColor: Colors.grey.withOpacity(0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 290,
                        left: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Movie.movieDetails['title'] != null
                                  ? Movie.movieDetails['title']
                                  : 'N/A',
                              style: TextStyle(
                                fontSize:
                                    Movie.movieDetails['title'].length < 35
                                        ? 30.0
                                        : 19.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Status: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  Movie.movieDetails['status'] != null
                                      ? Movie.movieDetails['status']
                                      : 'N/A',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Release Date: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  Movie.movieDetails['release_date'] != null
                                      ? Movie.movieDetails['release_date']
                                      : 'N/A',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Runtime: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  Movie.movieDetails['runtime'] != null
                                      ? '${Movie.movieDetails['runtime']} mins'
                                      : 'N/A',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Genres: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  '${Movie.movieDetails['genres'][0]['name']}  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  Movie.movieDetails['genres']
                                              .asMap()
                                              .containsKey(1) &&
                                          Movie
                                                  .movieDetails['genres'][0]
                                                      ['name']
                                                  .length <
                                              18
                                      ? '${Movie.movieDetails['genres'][1]['name']}'
                                      : '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                    future: obj.checkIfUserIsSubscribed(email),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        subscribed = obj.subscribed;
                        return subscribed
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80.0, vertical: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen(
                                              videoID: Movie.movieVideoURL(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Ionicons.play_circle,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                          Text(
                                            'Play',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          print('Add To Favorite pressed'),
                                      //todo: as user taps this add movie to favorite list
                                      child: Column(
                                        children: [
                                          Icon(
                                            Ionicons.add_circle_outline,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                          Text(
                                            'Add To Favorite',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => print('Download pressed'),
                                      //todo: as user taps this download movie
                                      child: Column(
                                        children: [
                                          Icon(
                                            Ionicons.download_outline,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                          Text(
                                            'Download',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.yellow[600],
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 60.0, vertical: 20.0),
                                      ),
                                      child: Text(
                                        'Subscribe',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          showLoader = true;
                                        });
                                        await PaymentMethods.initializePayment(
                                            email);
                                        String url =
                                            PaymentMethods.authorizationURL;
                                        if (await canLaunch(url)) {
                                          await launch(
                                            url,
                                            forceSafariVC: true,
                                            forceWebView: true,
                                            enableJavaScript: true,
                                          );
                                          await PaymentMethods.verifyPayment(
                                              PaymentMethods.referenceCode);
                                          PaymentMethods.paymentVerification ==
                                                  true
                                              ? subscribed = true
                                              : subscribed = false;
                                          setState(() {
                                            showLoader = false;
                                          });
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          print('Add To Favorite pressed'),
                                      //todo: as user taps this add movie to favorite list
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.add_circle_outline_sharp,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          Text(
                                            'Add To Favorite',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 23.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Movie.movieDetails['overview'] == ''
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'N/A',
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                            )
                          : Text(
                              Movie.movieDetails['overview'],
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18.0,
                              ),
                            ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cast',
                        style: TextStyle(
                            fontSize: 23.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Movie.movieDetails['credits']['cast'].length == 0
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'N/A',
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 130,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Movie
                                              .movieDetails['credits']['cast']
                                              .length >=
                                          5
                                      ? 5
                                      : Movie.movieDetails['credits']['cast']
                                          .length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: imagePath(Movie
                                                  .movieDetails['credits']
                                              ['cast'][index]['profile_path']),
                                          imageBuilder:
                                              (context, imageBuilder) {
                                            return Container(
                                              margin:
                                                  EdgeInsets.only(right: 10.0),
                                              child: CircleAvatar(
                                                radius: 55.0,
                                                backgroundImage: imageBuilder,
                                              ),
                                            );
                                          },
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: Container(
                                                width: 110.0,
                                                height: 110.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            baseColor: Color(0xff063048),
                                            highlightColor:
                                                Colors.grey.withOpacity(0.0),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'N/A',
                                                style: TextStyle(
                                                  fontSize: 23.0,
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          Movie.movieDetails['credits']['cast']
                                              [index]['original_name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommendations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Movie.movieDetails['recommendations']['results'].length ==
                              0
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'N/A',
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 200,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Movie
                                              .movieDetails['recommendations']
                                                  ['results']
                                              .length >=
                                          5
                                      ? 5
                                      : Movie
                                          .movieDetails['recommendations']
                                              ['results']
                                          .length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border:
                                              Border.all(color: Colors.white38),
                                        ),
                                        margin: EdgeInsets.only(right: 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: CachedNetworkImage(
                                            imageUrl: imagePath(
                                                Movie.movieDetails[
                                                            'recommendations']
                                                        ['results'][index]
                                                    ['poster_path']),
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Container(
                                                    height: 200,
                                                    width: 120,
                                                    color: Colors.white,
                                                  )),
                                              baseColor: Color(0xff063048),
                                              highlightColor:
                                                  Colors.grey.withOpacity(0.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.id,
                                            arguments: [
                                              id = Movie.movieDetails[
                                                      'recommendations']
                                                      ['results'][index]['id']
                                                  .toString(),
                                              type,
                                            ]);
                                        print(id);
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
