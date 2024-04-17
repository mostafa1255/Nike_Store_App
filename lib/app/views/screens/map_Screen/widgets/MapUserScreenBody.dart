import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUserScreenBody extends StatefulWidget {
  const MapUserScreenBody({super.key});

  @override
  State<MapUserScreenBody> createState() => _MapUserScreenBodyState();
}

class _MapUserScreenBodyState extends State<MapUserScreenBody> {
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(31.20176, 29.91582),
    zoom: 13.2,
  );
  GoogleMapController? gmc;
  int id = 3;
  List<Marker> markers = [
    // Marker(markerId: MarkerId("1"), position: LatLng(31.20176, 29.91582)),
    // Marker(markerId: MarkerId("2"), position: LatLng(31.20, 29.915))
  ];
  StreamSubscription<Position>? positionStream;
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {}

    if (permission == LocationPermission.denied) {
      print("denied");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (kDebugMode) {
          print("denied 2");
        }
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("denied for ever");
    }
    if (permission == LocationPermission.whileInUse) {
      positionStream =
          Geolocator.getPositionStream().listen((Position? position) async {
        markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(position!.latitude, position.longitude),
        ));

        //animate Camera for camera wailk with person
        setState(() {
          gmc?.animateCamera(CameraUpdate.newLatLng(
              LatLng(position.latitude, position.longitude)));
        });
      });
    }
  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  void dispose() {
    if (positionStream != null) {
      positionStream?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 880,
      child: GoogleMap(
        myLocationEnabled: true,
        onTap: (LatLng latLng) async {
          setState(() {
            markers.add(Marker(
                markerId: const MarkerId("1"),
                position: LatLng(latLng.latitude, latLng.longitude)));
          });
          print("+++++++++++++++++");
          print(latLng.latitude);
          print(latLng.longitude);
          id++;
          print("=============================");
          List<Placemark> placemarks =
              await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
          print(placemarks[0].country);
          print(placemarks[0].name);
          print(placemarks[0].postalCode);
        },
        markers: markers.toSet(),
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (controller) {
          gmc = controller;
        },
      ),
    );
  }
}
