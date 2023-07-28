import 'package:flutter/material.dart';
import 'package:spacex/App/Utils/components/view/spacex_background_view.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key, required this.model}) : super(key: key);
  final HomeResponseModel model;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceXBacground(
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
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "${widget.model.details}",
                          style: const TextStyle(fontSize: 10, color: Colors.green, fontFamily: "PressStart2P"),
                          // textAlign: TextAlign.center,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "wiki: ${widget.model.links?.article}",
                          style: const TextStyle(fontSize: 8, color: Colors.green, fontFamily: "PressStart2P"),
                          textAlign: TextAlign.center,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "wiki: ${widget.model.links?.wikipedia}",
                          style: const TextStyle(fontSize: 8, color: Colors.green, fontFamily: "PressStart2P"),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
