import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/map_cubit/map_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomBackIcon.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../common_widgets/customMainButton.dart';

class MapUserScreenBody extends StatefulWidget {
  const MapUserScreenBody({super.key, this.lat, this.lng});
  final String? lat;
  final String? lng;
  @override
  State<MapUserScreenBody> createState() => _MapUserScreenBodyState();
}

class _MapUserScreenBodyState extends State<MapUserScreenBody> {
  late CameraPosition kGooglePlex;

  GoogleMapController? gmc;
  List<Placemark>? placemarks;
  String sourceId = "1";
  Set<Marker> markers = {};

  List<LatLng> polylineCoordinates = [];

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
          markerId: MarkerId(sourceId),
          position: LatLng(position!.latitude, position.longitude),
        ));

        //animate Camera for camera wailk with person
      });
    }
  }

  @override
  void initState() {
    kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.lat!), double.parse(widget.lng!)),
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
      create: (context) => MapCubit(apiServices:  ApiServices(dio: Dio())),
      child: SizedBox(
          height: 880.h,
          child: Stack(
            children: [
              GoogleMap(
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
                onTap: (LatLng latLng) async {
                  setState(() {
                    markers.add(Marker(
                        markerId: MarkerId(sourceId),
                        position: LatLng(latLng.latitude, latLng.longitude)));
                  });
                  await BlocProvider.of<MapCubit>(context).changeUserPosition(
                      latitude: latLng.latitude, longitude: latLng.longitude);
                },
                markers: markers.toSet(),
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
