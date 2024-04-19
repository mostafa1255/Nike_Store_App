part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

class MapLoading extends MapState {}

final class MapUpdated extends MapState {
  final String streetName;
  MapUpdated({required this.streetName});
}

class MapError extends MapState {
  final String error;

  MapError({required this.error});
}
