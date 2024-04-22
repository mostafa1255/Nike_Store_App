import 'package:flutter/material.dart';

import '../../../../core/styles/text_Style.dart';
import '../../../../data/manager/home_cubits/OutDoor_cubit/out_door_cubit.dart';
import '../../../common_widgets/CustomShimmerProductListViewHomeScreen.dart';
import 'CustomHomeCardListView.dart';

Widget buildBlocContent(OutDoorState state, {context}) {
  switch (state) {
    case OutDoorProductsSuccess():
      return CustomHomeCardListView(
        products: state.products,
      );
    case OutDoorProductsFailure():
      return Center(
        child: Text(
          state.errMessage,
          style: Txtstyle.style16(context: context)
              .copyWith(color: const Color.fromARGB(255, 58, 54, 54)),
        ),
      );
    default:
      return const CustomShimmerProductListViewHomeScreen();
  }
}
