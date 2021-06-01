import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:stream_house/models/userModel.dart';
import 'package:stream_house/services/networking.dart';

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
              imageUrl: '',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 9.0),
              child: Container(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ));
  }
}
