import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/core/utils/paymob_Keys.dart';
import 'package:nike_store_app/app/data/manager/map_cubit/map_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomBackIcon.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../common_widgets/customMainButton.dart';

class TrackOrdersScreenBody extends StatefulWidget {
  const TrackOrdersScreenBody({
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
  State<TrackOrdersScreenBody> createState() => _MapUserScreenBodyState();
}

class _MapUserScreenBodyState extends State<TrackOrdersScreenBody> {
  late CameraPosition kGooglePlex;

  GoogleMapController? gmc;
  List<Placemark>? placemarks;
  String sourceId = "1";
  String destinationId = "2";
  String currentId = "0";
  Set<Marker> markers = {};

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ApiKeys.googleMapApiKey,
      PointLatLng(widget.slat, widget.slng),
      PointLatLng(widget.dlat, widget.dlng),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  void initMarker() {
    markers.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId(sourceId),
      position: LatLng(widget.slat, widget.slng),
    ));
    markers.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId(destinationId),
      position: LatLng(widget.dlat, widget.dlng),
    ));
  }

  StreamSubscription<Position>? positionStream;
  _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled || permission == LocationPermission.denied) {
      return;
    }
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) async {
      /* markers.add(Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        markerId: MarkerId(currentId),
        position: LatLng(position!.latitude, position.longitude),
      ));
      */
      markers.add(Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        markerId: MarkerId(destinationId),
        position: LatLng(widget.dlat, widget.dlng),
      ));
      setState(() {});
      double distance = await Geolocator.distanceBetween(
        position!.latitude,
        position.longitude,
        widget.dlat,
        widget.dlng,
      );
      print("#" * 30);
      print(distance);
      if (distance <= 10) {
        //Action to Tell The User Delivery Is Done Send Notification
        // Destination reached, stop tracking
        positionStream?.cancel();
      }
    });
  }

  @override
  void initState() {
    getPolyPoints();
    initMarker();
    kGooglePlex = CameraPosition(
      target: LatLng(widget.slat, widget.slng),
      zoom: 13.2,
    );
    _determinePosition();
    super.initState();
  }

  @override
  void dispose() {
    if (positionStream != null) {
      //gmc?.dispose();
      positionStream?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: SizedBox(
          height: 880.h,
          child: Stack(
            children: [
              GoogleMap(
                polylines: {
                  Polyline(
                    polylineId: const PolylineId("route"),
                    points: polylineCoordinates,
                    color: AppColors.kPrimaryColor,
                    width: 6,
                  ),
                },
                myLocationEnabled: true,
                onCameraMove: (CameraPosition position) {
                  // Restrict the visible area to only show Egypt
                  if (position.target.latitude < 22.0 ||
                      position.target.latitude > 31.6 ||
                      position.target.longitude < 25.0 ||
                      position.target.longitude > 34.0) {
                    // Reset the camera position to stay within Egypt bounds
                    gmc!.animateCamera(
                      CameraUpdate.newLatLng(const LatLng(26.8206, 30.8025)),
                    );
                  }
                },
                markers: markers,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                onMapCreated: (controller) {
                  gmc = controller;
                },
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomBackAndFavIcon(
                        iconData: Icons.arrow_back_ios_rounded,
                        onPressed: () {
                          if (GoRouter.of(context).canPop()) {
                            GoRouter.of(context).pop();
                          }
                        },
                      ),
                      const HsizedBox(width: 90),
                      Text(
                        "My Location",
                        style: Txtstyle.style18(context: context).copyWith(
                            color: AppColors.kOfWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.relwayFamily),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20.h,
                left: 5.w,
                width: 300.w,
                child: CustomMainButton(
                    fcolorWhite: true,
                    color: AppColors.kPrimaryColor,
                    txt: "Done",
                    onPressed: () async {
                      if (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                    }),
              )
            ],
          )),
    );
  }
}
