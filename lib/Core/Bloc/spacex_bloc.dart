import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:spacex/App/Constants/http_constants.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';
import 'package:spacex/Core/http_client.dart';
import '../../App/Utils/Enums/base_http_status_enum.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

typedef HttpClient = http.Client;

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  SpaceXBloc(this.client) : super(const SpaceXState()) {
    on<SpaceXGet>(getAllData);
  }
  final HttpClient client;

  Future getAllData(SpaceXGet event, Emitter<SpaceXState> emit) async {
    emit(state.copyWith(showLoading: true));
    try {
      final List<HomeResponseModel>? response = await _fetchSpaceX();
      if (response != null) {
        inspect(response);
        emit(state.copyWith(data: response, showLoading: false));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(showLoading: false));
  }
}

_fetchSpaceX() async {
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

  // _deleteSpaceX(String id) async {
  //   try {
  //     final response = await http.delete(Uri.parse('https://api.spacexdata.com/v4/launches/$id'));
  //     if (response.statusCode == 200) {
  //       List<dynamic> decode = json.decode(response.body);
  //       inspect(decode);
  //       return decode.map((e) => e.toString()); 
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

