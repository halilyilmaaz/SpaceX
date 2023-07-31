import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spacex/App/Utils/Enums/base_http_status_enum.dart';
import 'package:spacex/App/Utils/route/page_navigation.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';
import 'package:spacex/Screens/Detail/detail_view.dart';
import 'package:spacex/Screens/Home/home_view.dart';

class Screens extends PageNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Screens? _screens;
  late _MainScreens main;

  Screens() {
    main = _MainScreens();
  }

  Screens._init() {
    _screens = Screens();
  }

  static BuildContext get context => Screens.instance.navigatorKey.currentContext!;

  static Screens get instance => _screens ?? Screens._init();
}

class _MainScreens extends PageNavigation {
  String homePage = _getMainScreenName('homePage');
  String detailPage = _getMainScreenName('detailPage');

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == homePage) {
      return goToPage(SpaceXHome(), settings);
    } else if (settings.name == detailPage) {
      final argument = settings.arguments as HomeResponseModel;
      return goToPage(DetailView(model: argument), settings);
    } else {
      goToPage(Container(color: Colors.black), settings);
    }
  }
}

/// Hiç bi Modül altında olmayan ekranların isimlendirme şablonu bu Fon. la belirlenir
String _getMainScreenName(String screenName) {
  var value = '/$screenName${describeEnum(ScreensType.OutScreen)}';
  log(value, name: 'Screen Name In Route');
  return value;
}
