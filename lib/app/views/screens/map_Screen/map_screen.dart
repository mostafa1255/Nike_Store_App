import 'package:flutter/material.dart';

import 'widgets/MapUserScreenBody.dart';

class MapUserScreen extends StatelessWidget {
  const MapUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapUserScreenBody(),
    );
  }
}
