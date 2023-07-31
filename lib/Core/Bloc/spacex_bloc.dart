import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/Core/Models/Response/HomeModel.dart';
import 'package:spacex/Core/BL/spaceX_service.dart';
import '../../App/Utils/Enums/base_http_status_enum.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  SpaceXBloc() : super(const SpaceXState(data: null)) {
    on<SpaceXGet>(getAllData);
    on<SpaceXDelete>(deleteMission);
  }

  Future getAllData(SpaceXGet event, Emitter<SpaceXState> emit) async {
    emit(state.copyWith(showLoading: true));
    try {
      final List<HomeResponseModel>? response = await SpaceXService().fetchSpaceX();
      if (response != null) {
        inspect(response);
        emit(state.copyWith(data: response, showLoading: false));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(showLoading: false));
  }

  Future deleteMission(SpaceXDelete event, Emitter<SpaceXState> emit) async {
    emit(state.copyWith(showLoading: true));
    try {
      final String? response = await SpaceXService().deleteSpaceX(event.id);
      if (response != null) {
        emit(state.copyWith(data: response, showLoading: false));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(state.copyWith(showLoading: false));
  }
}

