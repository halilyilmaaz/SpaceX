import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:spacex/Core/Models/Response/HomeModel.dart';
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
      //   await Future<void>.delayed(const Duration(seconds: 2));
      //emit(state.copyWith(showLoading: false));
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(showLoading: false));
  }

  Future<void> spaceXGeted(SpaceXGet event, Emitter<SpaceXState> emit) async {
    if (state.isComplated) return;
    if (state.status == BaseHttpStatus.init) {
      final data = await _fetchSpaceX();
      return emit(state.copyWith(status: BaseHttpStatus.success, data: data, isComplated: false));
    }
    _fetchSpaceX();
  }

  _fetchSpaceX() async {
    try {
      final response = await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));
      if (response.statusCode == 200) {
        List<dynamic> decode = json.decode(response.body);
        inspect(decode);

        return decode.map((e) => HomeResponseModel.fromJson(e)).toList();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
