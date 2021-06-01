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

class MovieDetailsScreen extends StatefulWidget {
  final String id;

  const MovieDetailsScreen({Key key, @required this.id}) : super(key: key);
  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool showLoader = false;
  bool subscribed;

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserModel>(context).email;
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
                      movieBannerDisplay(context),
                      moviePosterDisplay(context),
                      movieHeaderDisplay(context),
                    ],
                  ),
                ),
                FutureBuilder(
                    future: PaymentMethods.checkIfUserIsSubscribed(email),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        subscribed = PaymentMethods.subscribed;
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
                                                      movieID: Movie
                                                          .movieVideoURL())),
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
                movieOverview(context),
                movieCast(context, widget.id),
                SizedBox(
                  height: 10.0,
                ),
                movieRecommendations(context, widget.id),
                SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget movieBannerDisplay(BuildContext context) => ClipRRect(
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
    );

Widget moviePosterDisplay(BuildContext context) => Positioned(
      top: 230,
      left: 20.0,
      child: Container(
        height: 200,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              baseColor: Color(0xff063048),
              highlightColor: Colors.grey.withOpacity(0.0),
            ),
          ),
        ),
      ),
    );

Widget movieHeaderDisplay(BuildContext context) => Positioned.fill(
      top: 290,
      left: 150.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Movie.movieDetails['title'],
            style: TextStyle(
              fontSize: Movie.movieDetails['title'].length < 35 ? 30.0 : 19.0,
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
                Movie.movieDetails['status'],
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
                Movie.movieDetails['release_date'],
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
                '${Movie.movieDetails['runtime']} mins',
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
                Movie.movieDetails['genres'].asMap().containsKey(1)
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
    );

Widget movieOverview(BuildContext context) => Container(
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
          Text(
            Movie.movieDetails['overview'],
            style: TextStyle(color: Colors.grey[400], fontSize: 18.0),
          ),
        ],
      ),
    );

Widget movieCast(BuildContext context, String id) => Container(
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
          FutureBuilder(
              future: Movie.getMovieCast(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 130,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0),
                                width: 110.0,
                                height: 110.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: CachedNetworkImage(
                                    imageUrl: imagePath(
                                        Movie.movieCast[index]['profile_path']),
                                    fit: BoxFit.fill,
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
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              Movie.movieCast[index]['original_name'],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return Shimmer.fromColors(
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    color: Colors.white,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                );
              }),
        ],
      ),
    );

Widget movieRecommendations(BuildContext context, String id) => Container(
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
          FutureBuilder(
              future: Movie.getRecommendedMovies(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white38),
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              imageUrl: imagePath(Movie.recommendedMovies[index]
                                  ['poster_path']),
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Shimmer.fromColors(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      height: 200,
                                      width: 120,
                                      color: Colors.white,
                                    )),
                                baseColor: Color(0xff063048),
                                highlightColor: Colors.grey.withOpacity(0.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Shimmer.fromColors(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.white,
                  ),
                  baseColor: Color(0xff063048),
                  highlightColor: Colors.grey.withOpacity(0.0),
                );
              }),
        ],
      ),
    );

// showModalBottomSheet(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//             top: Radius.circular(30.0))),
//     backgroundColor: Colors.white,
//     context: context,
//     isScrollControlled: true,
//     isDismissible: false,
//     builder: (context) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 20, vertical: 8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                     icon: Icon(Ionicons
//                         .close_circle_outline),
//                     //padding: EdgeInsets.only(right: 30.0, top: 10.0),
//                     splashRadius: 20.0,
//                     iconSize: 30.0,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     }),
//               ),
//               Text(
//                 'Set up your payment',
//                 style: TextStyle(
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.w500),
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Name',
//                       ),
//                       onChanged: (String nom) {
//                         name = nom;
//                       },
//                       validator: (nom) {
//                         if (nom.isEmpty) {
//                           return 'enter name';
//                         }
//                         return null;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           labelText:
//                               'Card Number'),
//                       onChanged:
//                           (String cardNum) {
//                         cardNumber = cardNum;
//                       },
//                       validator: (cardNum) {
//                         if (cardNum.isEmpty) {
//                           return 'enter card number';
//                         }
//                         return null;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           labelText:
//                               'expiry date (mm/yyyy)'),
//                       onChanged:
//                           (String expiryDate) {
//                         cardExpiryDate =
//                             expiryDate;
//                       },
//                       validator: (expiryDate) {
//                         if (expiryDate.isEmpty) {
//                           return 'enter expiry date';
//                         }
//                         return null;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           labelText:
//                               'Security Code (CVV)'),
//                       onChanged: (String cvv) {
//                         cardCVV = cvv;
//                       },
//                       validator: (cvv) {
//                         if (cvv.isEmpty) {
//                           return 'enter security code';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 30.0),
//                     RoundedRaisedButton(
//                         buttonText: 'Complete',
//                         onPressed: () {
//                           if (_formKey
//                               .currentState
//                               .validate()) {
//                             print(name);
//                             print(cardNumber);
//                             print(cardExpiryDate);
//                             print(cardCVV);
//                           }
//                         }),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       );
//     });
