

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:spacex/App/Constants/http_constants.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';
import 'package:spacex/Core/http_client.dart';

class SpaceXService {
  fetchSpaceX() async {
  try {
    var response = await HttpClients().get(HttpUrl.rocketList, "");
    if (response!.statusCode == HttpStatus.ok) {
      List<dynamic> decode = json.decode(response.body);
      inspect(decode);
      return decode.map((e) => HomeResponseModel.fromJson(e)).toList();
    }
  } catch (e) {
    log(e.toString(), name: 'Api Error: getService');
  }
}

deleteSpaceX(String id) async {
  try {
    final response = await HttpClients().delete(HttpUrl.deleteRocket(id));
    if (response!.statusCode == 200) {
      List<dynamic> decode = json.decode(response.body);
      inspect(decode);
      return decode.map((e) => e.toString());
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
}