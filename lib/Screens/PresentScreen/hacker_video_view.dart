import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HackerVideoView extends StatefulWidget {
  const HackerVideoView({Key? key}) : super(key: key);

  @override
  State<HackerVideoView> createState() => _HackerVideoViewState();
}

class _HackerVideoViewState extends State<HackerVideoView> {

  final videoURL = "https://youtu.be/RfiQYRn7fBg";

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final viewoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(initialVideoId: viewoID!, flags: const YoutubePlayerFlags(
      autoPlay: true
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hacker")
      ),
      body: Center(
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          ),
      ),
    );
  }
}