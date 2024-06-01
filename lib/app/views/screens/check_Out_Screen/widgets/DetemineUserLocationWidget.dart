import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/tools/save_user_info.dart';
import 'package:nike_store_app/app/data/manager/map_cubit/map_cubit.dart';

class DetemineUserLocationWidget extends StatelessWidget {
  const DetemineUserLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is MapLoading) {
          return Text(
            "Loading...",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.7),
            ),
          );
        } else if (state is MapUpdated) {
          SaveUserInfo.saveUserLatitude(state.latitude.toString());
          SaveUserInfo.saveUserLongitude(state.longitude.toString());
          print("${state.latitude} ${state.longitude}");
          return Text(
            state.streetName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.7),
            ),
          );
        } else if (state is MapError) {
          return Text(state.error,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.withOpacity(0.7),
              ));
        } else {
          return const Text("There is no address");
        }
      },
    );
  }
}
