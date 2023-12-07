import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/HsizedBox.dart';

AppBar favoriteScreenAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: AppColors.kOfWhiteColor,
    leading: CustomBackAndFavIcon(
      onPressed: () {},
    ),
    title: Text(
      "Favourite",
      style: Txtstyle.style16(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w500,
          fontFamily: Constants.relwayFamily),
    ),
    centerTitle: true,
    actions: [
      CustomBackAndFavIcon(
        onPressed: () {},
        iconData: Icons.favorite_border,
      ),
      HsizedBox(width: 15.w)
    ],
  );
}
