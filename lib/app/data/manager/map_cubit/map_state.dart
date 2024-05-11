part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

class MapLoading extends MapState {}

final class MapUpdated extends MapState {
  final String streetName;
  final double latitude;
  final double longitude;
  MapUpdated({required this.latitude,required this.longitude, required this.streetName});
}

class MapError extends MapState {
  final String error;

  MapError({required this.error});
}
