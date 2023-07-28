part of './spacex_bloc.dart';

class SpaceXState extends Equatable {
  final List<HomeResponseModel> data;
  final bool isComplated;
  final BaseHttpStatus status;
  final bool showLoading;

  const SpaceXState(
      {this.data = const [], this.isComplated = false, this.status = BaseHttpStatus.init, this.showLoading = true});

  @override
  List<Object?> get props => [data, isComplated, status, showLoading];

  SpaceXState copyWith({
    List<HomeResponseModel>? data,
    bool? isComplated,
    BaseHttpStatus? status,
    bool? showLoading,
  }) {
    return SpaceXState(
      data: data ?? this.data,
      isComplated: isComplated ?? this.isComplated,
      status: status ?? this.status,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
