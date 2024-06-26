import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static double? latitude;
  static double? longitude;

  static Future<Position> determinePosition(
      {double? latitude, double? longitude}) async {
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
    if (latitude != null && longitude != null) {
      Position pos = await Geolocator.getCurrentPosition();
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
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getCurrentPositionStreet(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);

    return placemark[0].street!;
  }

//
}
