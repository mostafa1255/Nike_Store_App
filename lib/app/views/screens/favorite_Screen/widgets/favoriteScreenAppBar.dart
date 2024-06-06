import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../common_widgets/CustomBackIcon.dart';
import '../../../common_widgets/HsizedBox.dart';

AppBar favAndNotifScreenAppBar(
    BuildContext context,
    String title,
    void Function()? onPressed1,
    void Function()? onPressed2,
    IconData? iconData) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: AppColors.kOfWhiteColor,
    leading: CustomBackAndFavIcon(
      onPressed: () {
        if (GoRouter.of(context).canPop()) {
          GoRouter.of(context).pop();
        }
      },
    ),
    title: Text(
      title,
      style: Txtstyle.style16(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.relwayFamily),
    ),
    centerTitle: true,
    actions: iconData != null
        ? [
            CustomBackAndFavIcon(
              onPressed: () {
                if (GoRouter.of(context).canPop()) {
                  GoRouter.of(context).pop();
                }
              },
              iconData: iconData,
            ),
            HsizedBox(width: 15.w)
          ]
        : null,
  );
}
