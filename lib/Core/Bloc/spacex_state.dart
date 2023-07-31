part of './spacex_bloc.dart';

class SpaceXState<T> extends Equatable {
  final T data;
  final bool isComplated;
  final BaseHttpStatus status;
  final bool showLoading;

  const SpaceXState({
    required this.data,
    this.isComplated = false,
    this.status = BaseHttpStatus.init,
    this.showLoading = true,
  });

  @override
  List<Object?> get props => [data, isComplated, status, showLoading];

  SpaceXState<T> copyWith({
    T? data,
    bool? isComplated,
    BaseHttpStatus? status,
    bool? showLoading,
  }) {
    return SpaceXState<T>(
      data: data ?? this.data,
      isComplated: isComplated ?? this.isComplated,
      status: status ?? this.status,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
