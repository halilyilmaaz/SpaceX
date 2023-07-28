import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/App/Utils/components/Buttons/gradient_button.dart';
import 'package:spacex/App/Utils/components/view/spacex_background_view.dart';
import 'package:spacex/App/Utils/route/route.dart';
import 'package:spacex/Core/Bloc/spacex_bloc.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';
import 'package:spacex/Screens/Detail/detail_view.dart';

class SpaceXHome extends StatelessWidget {
  const SpaceXHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpaceXBloc>(
      create: (_) => SpaceXBloc(HttpClient()),
      child: const HomeDeneme(),
    );
  }
}

class HomeDeneme extends StatefulWidget {
  const HomeDeneme({Key? key}) : super(key: key);

  @override
  State<HomeDeneme> createState() => _HomeDenemeState();
}

class _HomeDenemeState extends State<HomeDeneme> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<SpaceXBloc>().add(SpaceXGet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceXBacground(
        child: BlocConsumer<SpaceXBloc, SpaceXState>(
          listener: (_, __) {},
          builder: (_, state) {
            if (state.showLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.data.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Screens.instance.main.detailPage, arguments: state.data[index]);
                        },
                        child: CustomOutline(
                            strokeWidth: 0.6,
                            radius: 10,
                            padding: const EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.1,
                            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                              Colors.pink,
                              Colors.pink.withOpacity(0),
                              Colors.green.withOpacity(0.1),
                              Colors.green
                            ], stops: const [
                              0.2,
                              0.4,
                              0.6,
                              1
                            ]),
                            child: Center(
                              child: ListTile(
                                leading: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    child: Image.network(state.data[index].links?.patch?.small ?? "")),
                                title: Text(
                                  state.data[index].name.toString(),
                                  style: const TextStyle(fontSize: 14, color: Colors.white, fontFamily: "PressStart2P"),
                                ),
                              ),
                            )),
                      ),
                    );

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, Screens.instance.main.detailPage);
                    //   },
                    //   child: SizedBox(
                    //     height: MediaQuery.of(context).size.height * 0.1,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: ListTile(
                    //       leading: Card(child: Image.network(state.data[index].links?.patch?.small ?? "")),
                    //       title: Text(
                    //         state.data[index].name.toString(),
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
                  });
            } else {
              return const Text("xx");
            }
          },
        ),
      ),
    );
  }
}
