import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/screens/detailsScreen/detailsScreen.dart';
import 'package:stream_house/screens/videoPlayerScreen/videoPlayerScreen.dart';
import 'package:stream_house/services/networking.dart';
import 'package:url_launcher/url_launcher.dart';

class TVShowDetailsScreen extends StatefulWidget {
  @override
  _TVShowDetailsScreenState createState() => _TVShowDetailsScreenState();
}

class _TVShowDetailsScreenState extends State<TVShowDetailsScreen> {
  bool showLoader = false;
  bool subscribed;
  PaymentMethods obj = PaymentMethods();

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserModel>(context).email;
    String id = '';
    String type = 'tvShow';
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
                      Positioned.fill(
                        top: 290,
                        left: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TVShow.tvShowDetails['name'] != null
                                  ? TVShow.tvShowDetails['name']
                                  : 'N/A',
                              style: TextStyle(
                                fontSize:
                                    TVShow.tvShowDetails['name'].length < 35
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
                                  TVShow.tvShowDetails['status'] != null
                                      ? TVShow.tvShowDetails['status']
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
                                  'Number of Seasons: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  TVShow.tvShowDetails['number_of_seasons'] !=
                                          null
                                      ? TVShow
                                          .tvShowDetails['number_of_seasons']
                                          .toString()
                                      : 'N/A',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Number of Episodes: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  TVShow.tvShowDetails['number_of_episodes'] !=
                                          null
                                      ? TVShow
                                          .tvShowDetails['number_of_episodes']
                                          .toString()
                                      : 'N/A',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
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
                                  '${TVShow.tvShowDetails['genres'][0]['name']}  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  TVShow.tvShowDetails['genres']
                                              .asMap()
                                              .containsKey(1) &&
                                          TVShow
                                                  .tvShowDetails['genres'][0]
                                                      ['name']
                                                  .length <
                                              18 &&
                                          TVShow
                                                  .tvShowDetails['genres'][1]
                                                      ['name']
                                                  .length <
                                              8
                                      ? '${TVShow.tvShowDetails['genres'][1]['name']}'
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
                                            videoID: TVShow.tvShowVideoURL(),
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
                  },
                ),
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
                      TVShow.tvShowDetails['overview'] == ''
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
                              TVShow.tvShowDetails['overview'],
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
                      TVShow.tvShowDetails['credits']['cast'].length == 0
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
                                height: 130.0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: TVShow
                                              .tvShowDetails['credits']['cast']
                                              .length >=
                                          5
                                      ? 5
                                      : TVShow.tvShowDetails['credits']['cast']
                                          .length,
                                  itemBuilder: (context, index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: imagePath(
                                          TVShow.tvShowDetails['credits']
                                              ['cast'][index]['profile_path'],
                                        ),
                                        imageBuilder: (context, imageBuilder) {
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
                                        TVShow.tvShowDetails['credits']['cast']
                                            [index]['original_name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
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
                      TVShow.tvShowDetails['recommendations']['results']
                                  .length ==
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
                                height: 200.0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: TVShow
                                              .tvShowDetails['recommendations']
                                                  ['results']
                                              .length >=
                                          5
                                      ? 5
                                      : TVShow.tvShowDetails['recommendations']
                                          ['results'],
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    child: Container(
                                      width: 120.0,
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
                                            TVShow.tvShowDetails[
                                                        'recommendations']
                                                    ['results'][index]
                                                ['poster_path'],
                                          ),
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                            id = TVShow.tvShowDetails[
                                                    'recommendations']
                                                    ['results'][index]['id']
                                                .toString(),
                                            type,
                                          ]);
                                      print(id);
                                    },
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
