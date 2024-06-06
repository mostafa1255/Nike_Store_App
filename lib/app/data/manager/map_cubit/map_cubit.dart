import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/utils/app_links.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({required this.apiServices}) : super(MapInitial());
  ApiServices apiServices;
  Future<void> determineUserPosition() async {
    print("10" * 20);
    print("in determine user position");
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
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        String streetName = placemarks[0].street ?? 'Unknown Street';
        emit(MapUpdated(
            streetName: streetName, latitude: latitude, longitude: longitude));
      } else {
        emit(MapError(error: 'No placemark found for the given coordinates'));
      }
    } catch (e) {
      emit(MapError(error: 'No placemark found for the given coordinates'));
    }
  }

  Future<String> getDeleveryTimeMap() async {
    try {
      Response response = await apiServices.dioGet(url: AppLinks.url);
      var duration = response.data["routes"][0]["legs"][0]["duration"]["text"];
      print("Estimated travel time: $duration");
      return duration;
    } catch (e) {
      print("Error fetching travel time: $e");
      return "Ann Error";
    }
  }
}
