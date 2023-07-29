import 'package:flutter/material.dart';
import 'package:spacex/App/Utils/components/Buttons/gradient_button.dart';
import 'package:spacex/App/Utils/components/Buttons/text_button.dart';
import 'package:spacex/App/Utils/components/view/spacex_background_view.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key, required this.model}) : super(key: key);
  final HomeResponseModel model;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await closeInAppWebView();
    } else {
      throw 'Could not launch $url';
    }
  }

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final viewoID = YoutubePlayer.convertUrlToId(widget.model.links?.webcast ?? "");
    controller = YoutubePlayerController(initialVideoId: viewoID!, flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SpaceXBacground(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: const BackButton(color: Colors.pink),
                backgroundColor: Colors.transparent,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: NetworkImage(widget.model.links?.patch?.large ?? ""),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.model.name ?? "name",
                        style: const TextStyle(fontSize: 24, color: Colors.white, fontFamily: "PressStart2P"),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "flight number: ${widget.model.name}",
                        style: const TextStyle(fontSize: 14, color: Colors.pink, fontFamily: "PressStart2P"),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${widget.model.details}",
                        style: const TextStyle(fontSize: 10, color: Colors.green, fontFamily: "PressStart2P"),
                        // textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          color: Colors.brown,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 8),
                                  child: YoutubePlayer(
                                    controller: controller,
                                    showVideoProgressIndicator: true,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Wrap(
                                    runSpacing: 10,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Container(height: 40, width: 20, color: Colors.brown.shade900),
                                      CircleAvatar(backgroundColor: Colors.brown.shade900, radius: 10),
                                      CircleAvatar(backgroundColor: Colors.brown.shade900, radius: 10),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextBtn(
                        text: widget.model.links?.article ?? "",
                        onPressed: () => launchURL(widget.model.links?.article ?? ""),
                        fontSize: 8,
                      ),
                      TextBtn(
                        text: widget.model.links?.article ?? "",
                        onPressed: () => launchURL(widget.model.links?.wikipedia ?? ""),
                        fontSize: 8,
                      ),
                      CustomOutline(
                        onTap: () {
                          // delete fonk çağrılacak
                        },
                        strokeWidth: 1,
                        radius: 20,
                        padding: const EdgeInsets.all(3),
                        width: 160,
                        height: 38,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.pink, Colors.green],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pink.withOpacity(0.7), Colors.green.withOpacity(0.7)],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Launch',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
