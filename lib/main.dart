import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/App/Utils/Extensions/log+Extension.dart';
import 'package:spacex/App/Utils/Route/route.dart';
import 'package:spacex/Core/Bloc/spacex_bloc.dart';
import 'package:spacex/Screens/Home/home_view.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SpaceXBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Screens.instance;
    return MultiBlocProvider(
        providers: [
          BlocProvider<SpaceXBloc>(create: (_) => SpaceXBloc()),
        ],
        child: MaterialApp(
          title: 'SpaceX',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: Screens.instance.main.onGenerateRoute,
          home: const SpaceXHome(),
        ));
  }
}

class SpaceXBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    '$bloc'.log();
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    '$bloc'.log();
  }
}
