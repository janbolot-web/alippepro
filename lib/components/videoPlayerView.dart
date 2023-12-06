import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.url,
    required this.showControls,
    this.height,
    this.width,
    this.full,
    this.loop,
    this.auto,
    this.place,
  });
  final String url;
  final String showControls;
  final height;
  final width;
  final full;
  final loop;
  final auto;
  final place;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 1 / 1,
        autoPlay: widget.auto ?? true,
        allowFullScreen: widget.full ?? true,
        looping: widget.loop ?? true,
        placeholder: widget.place == null
            ? Text('')
            : Image.asset(widget.place.toString()),
        showControls: widget.showControls == "false" ? false : true);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 300,
      width: widget.width ?? 300,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Chewie(controller: _chewieController)),
    );
  }
}
