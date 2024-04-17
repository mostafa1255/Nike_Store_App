import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/Location_Services.dart';

class DetemineUserLocationWidget extends StatelessWidget {
  const DetemineUserLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
        future: LocationServices.determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: LocationServices.getCurrentPositionStreet(
                latitude: snapshot.data!.latitude,
                longitude: snapshot.data!.longitude,
              ),
              builder: (context, streetSnapshot) {
                if (streetSnapshot.hasData) {
                  return Text(
                    streetSnapshot.data!,
                    style: Txtstyle.style12(context: context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kDeepGreyColorA6A.withOpacity(0.7),
                      fontFamily: Constants.popinsFamily,
                    ),
                  );
                } else {
                  return const Text("Loading street name...");
                }
              },
            );
          } else {
            return const Text("There is no address");
          }
        },
      ),
    );
  }
}
