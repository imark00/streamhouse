import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/videoPlayerScreen/videoPlayerScreen.dart';
import 'package:stream_house/services/networking.dart';
import 'package:url_launcher/url_launcher.dart';

class TVShowDetailsScreen extends StatefulWidget {
  final String id;

  const TVShowDetailsScreen({Key key, this.id}) : super(key: key);
  @override
  _TVShowDetailsScreenState createState() => _TVShowDetailsScreenState();
}

class _TVShowDetailsScreenState extends State<TVShowDetailsScreen> {
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
            imageUrl: imagePath(TVShow.tvShowDetails['poster_path']),
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
              children: [
                Container(
                  height: 435.0,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90.0),
                          bottomRight: Radius.circular(90.0),
                        ),
                        child: Container(
                          height: 280,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90.0),
                              bottomRight: Radius.circular(90.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imagePath(
                                TVShow.tvShowDetails['backdrop_path'],
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            child: CachedNetworkImage(
                              imageUrl: imagePath(
                                  TVShow.tvShowDetails['poster_path']),
                              fit: BoxFit.fill,
                              placeholder: (context, _) => Shimmer.fromColors(
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
                      //todo: poster display
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
                                              VideoPlayerScreen(movieID: ''),
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
                  },
                ),
                //todo: overview display
                //todo: cast display

                //todo: recommendations display
              ],
            ),
          )
        ],
      ),
    );
  }
}
