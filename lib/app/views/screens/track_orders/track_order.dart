import 'package:flutter/material.dart';
import 'package:nike_store_app/app/views/screens/track_orders/widget/TrackOrdersScreenBody.dart';

class TrackOrdersScreen extends StatelessWidget {
  const TrackOrdersScreen({
    super.key,
    required this.slat,
    required this.slng,
    required this.dlat,
    required this.dlng,
  });
  final double slat;
  final double slng;
  final double dlat;
  final double dlng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrackOrdersScreenBody(
        dlat: dlat,
        dlng: dlng,
        slat: slat,
        slng: slng,
      ),
    );
  }
}
