import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../common_widgets/CustomBackIcon.dart';
import '../../common_widgets/customMainButton.dart';
import 'widgets/MapUserScreenBody.dart';

class CustomMapWidget extends StatefulWidget {
  @override
  _CustomMapWidgetState createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(26.8206, 30.8025), // Centered around Egypt
      zoom: 6.0, // Zoom level
    );

    return Stack(children: [
      GoogleMap(
        initialCameraPosition: initialCameraPosition,
        myLocationEnabled: true,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        onCameraMove: (CameraPosition position) {
          // Restrict the visible area to only show Egypt
          if (position.target.latitude < 22.0 ||
              position.target.latitude > 31.6 ||
              position.target.longitude < 25.0 ||
              position.target.longitude > 34.0) {
            // Reset the camera position to stay within Egypt bounds
            mapController!.animateCamera(
              CameraUpdate.newLatLng(LatLng(26.8206, 30.8025)),
            );
          }
        },
        onLongPress: (LatLng latLng) {
          // Check if the long press is within Egypt bounds
          if (latLng.latitude >= 22.0 &&
              latLng.latitude <= 31.6 &&
              latLng.longitude >= 25.0 &&
              latLng.longitude <= 34.0) {
            // Add a marker at the tapped location within Egypt bounds
            setState(() {
              markers.add(
                Marker(
                  markerId: MarkerId('marker_${markers.length}'),
                  position: latLng,
                ),
              );
            });
          } else {
            // User tapped a location outside Egypt, handle accordingly
            print('Please tap a location within Egypt');
          }
        },
        markers: markers,
      ),
      Positioned(
        bottom: 20,
        left: 5,
        width: 320.w,
        child: CustomMainButton(
            fcolorWhite: true,
            color: AppColors.kPrimaryColor,
            txt: "Done",
            onPressed: () {}),
      )
    ]);
  }
}

class MapUserScreen extends StatelessWidget {
  const MapUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapUserScreenBody(),
    );
  }
}
