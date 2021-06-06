import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoID;

  const VideoPlayerScreen({Key key, @required this.videoID}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoID),
      flags: YoutubePlayerFlags(
        controlsVisibleAtStart: false,
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: YoutubePlayer(
                  controller: _youtubePlayerController,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Ready',
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: Center(
                child: YoutubePlayer(
                  controller: _youtubePlayerController,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Ready',
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
        // child: Scaffold(
        //   backgroundColor: Colors.black,
        //   body: Center(
        //     child: YoutubePlayer(
        //       controller: _youtubePlayerController,
        //       showVideoProgressIndicator: true,
        //       onReady: () {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           SnackBar(
        //             content: Text(
        //               'Ready',
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
