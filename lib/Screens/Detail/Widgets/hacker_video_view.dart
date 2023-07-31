import 'package:flutter/material.dart';
import 'package:spacex/App/Constants/paddings.dart';
import 'package:spacex/App/Utils/Components/AlertDialog/movie_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HackerVideoView extends StatefulWidget {
  const HackerVideoView({Key? key}) : super(key: key);

  @override
  State<HackerVideoView> createState() => _HackerVideoViewState();
}

class _HackerVideoViewState extends State<HackerVideoView> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final viewoID = YoutubePlayer.convertUrlToId("https://youtu.be/RfiQYRn7fBg");
    controller = YoutubePlayerController(initialVideoId: viewoID!, flags: const YoutubePlayerFlags(autoPlay: true));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: Colors.red.shade900,
        child: Column(
          children: [
            const Text(
              "you didn't say the magic words",
              style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "PressStart2P"),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
