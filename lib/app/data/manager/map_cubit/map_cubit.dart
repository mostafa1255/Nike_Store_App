import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  Future<void> determineUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      emit(MapLoading());
      Position position = await Geolocator.getCurrentPosition();

      getCurrentPositionStreet(
          latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      emit(MapError(error: e.toString()));
    }
  }

  Future<void> changeUserPosition(
      {required double latitude, required double longitude}) async {
    emit(MapLoading());
    await getCurrentPositionStreet(latitude: latitude, longitude: longitude);
  }

  Future<void> getCurrentPositionStreet(
      {required double latitude, required double longitude}) async {
    try {
      emit(MapLoading());
      List<Placemark> placemark =
          await placemarkFromCoordinates(latitude, longitude);
      emit(MapUpdated(streetName: placemark[0].street!));
    } catch (e) {
      emit(MapError(error: e.toString()));
    }
  }
}
/*  Position pos = await Geolocator.getCurrentPosition();
      return Position(
          longitude: longitude,
          latitude: latitude,
          timestamp: pos.timestamp,
          accuracy: pos.accuracy,
          altitude: pos.altitude,
          altitudeAccuracy: pos.altitudeAccuracy,
          heading: pos.heading,
          headingAccuracy: pos.headingAccuracy,
          speed: pos.speed,
          speedAccuracy: pos.speedAccuracy);
    }* */