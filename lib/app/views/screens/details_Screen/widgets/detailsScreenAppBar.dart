import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/common_widgets/HsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../common_widgets/CustomBackIcon.dart';
import '../../../common_widgets/CustomCartIcon.dart';

AppBar detailsScreenAppBar(BuildContext context) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.kOfWhiteColor,
      leading: CustomBackAndFavIcon(
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(
        "Sneaker Shop",
        style: Txtstyle.style16(context: context).copyWith(
            color: AppColors.kFontColor,
            fontWeight: FontWeight.w500,
            fontFamily: Constants.relwayFamily),
      ),
      centerTitle: true,
      actions: [
        CustomCartIcon(
          onPressed: () {
            GoRouter.of(context).push(Approuter.mycartscreen);
          },
        ),
        HsizedBox(width: 15.w)
      ]);
}
