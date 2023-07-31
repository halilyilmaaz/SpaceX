part of './spacex_bloc.dart';

abstract class SpaceXEvent {}

class SpaceXGet extends SpaceXEvent {}

class SpaceXDelete extends SpaceXEvent {
  final String id;
  SpaceXDelete(this.id);
}
