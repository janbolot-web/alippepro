import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeIframe extends StatefulWidget {
  var type;
  var url;
  YoutubeIframe({super.key, this.type, this.url});

  @override
  State<YoutubeIframe> createState() => _YoutubeIframeState();
}

class _YoutubeIframeState extends State<YoutubeIframe> {
  var _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.url,
      autoPlay: false,
      
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        showControls: false,
        loop: false
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == "review") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          YoutubePlayerScaffold(
            controller: _controller,
            aspectRatio: 9 / 16,
            builder: (context, player) {
              return Column(
                children: [
                  player,
                ],
              );
            },
          ),
        ],
      );
    } else if (widget.type == 'story') {
      return YoutubePlayerScaffold(
        controller: _controller,
        aspectRatio: 16 / 9,
        builder: (context, player) {
          return Column(
            children: [
              player,
            ],
          );
        },
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(children: [
              Center(
                  child: YoutubePlayerScaffold(
                controller: _controller,
                aspectRatio: 1 / 1,
                builder: (context, player) {
                  return Column(
                    children: [
                      player,
                    ],
                  );
                },
              )),
              Container(
                color: Colors.transparent,
                child: AspectRatio(
                  aspectRatio: 1,
                ),
              )
            ]),
          ),
        ),
      );
    }
  }
}
