import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class YoutubeVideoPlayer extends StatefulWidget {
  var url;

  var type;

  YoutubeVideoPlayer({super.key, this.url, this.type});

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url);

    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: widget.type == 'story' ? false : true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == "main"
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Center(
                    child: widget.type == 'story'
                        ? YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            bottomActions: [])
                        : YoutubePlayer(
                            aspectRatio: widget.type == 'main' ? 1 / 1 : 16 / 9,
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            bottomActions: [],
                          )),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: widget.type == 'story'
                    ? YoutubePlayer(
                        aspectRatio: 9 / 16,
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        bottomActions: [])
                    : YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      )));
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
