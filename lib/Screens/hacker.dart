import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HackerView extends StatefulWidget {
  const HackerView({Key? key}) : super(key: key);

  @override
  State<HackerView> createState() => _HackerViewState();
}

class _HackerViewState extends State<HackerView> {

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