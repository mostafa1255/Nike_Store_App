import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../router/app_router.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/HsizedBox.dart';

PreferredSizeWidget profileScreenAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: AppColors.kOfWhiteColor,
    leading: CustomBackAndFavIcon(onPressed: () {
      GoRouter.of(context).push(Approuter.profilescreen);
    }),
    centerTitle: true,
    title: Text(
      "Profile",
      style: Txtstyle.style20(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w600,
          fontFamily: Constants.relwayFamily),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Text(
          "Done",
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: Constants.relwayFamily),
        ),
      ),
      const HsizedBox(width: 15)
    ],
  );
}
