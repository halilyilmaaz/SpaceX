import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex/App/Constants/http_constants.dart';

class HttpClients {
  final Map<String, String> headers = {"content-type": "application/json", 'authorization': 'Bearer ', 'lang': 'tr'};

  Future<http.Response?> get(String endpoint, String body,{Map<String, dynamic> apiParameters = const {}, Map<String, String>? header}) async {

    Map<String, String> header0 = {};
    if (header != null) {
      header0.addAll(headers);
    }
    var response = await http.get(Uri.parse(HttpUrl.baseUrl + endpoint + body), headers: header0);
    return response;
  }

  Future<http.Response?> delete(String endpoint,
      {Map<String, dynamic> apiParameters = const {}, Map<String, String>? header}) async {
        Map<String, String> header0 = {};
    if (header != null) {
      header0.addAll(headers);
    }

    var encodedBody = json.encode(apiParameters);
    var response = await http.delete(Uri.parse(HttpUrl.baseUrl + endpoint), body: encodedBody, headers: header0);
    return response;
  }
}
