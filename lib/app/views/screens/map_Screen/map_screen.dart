import 'package:flutter/material.dart';

import 'widgets/MapUserScreenBody.dart';

class MapUserScreen extends StatelessWidget {
  const MapUserScreen({super.key, this.lat, this.long});
  final String? lat;
  final String? long;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapUserScreenBody(
        lat: lat,
        lng: long,
      ),
    );
  }
}
