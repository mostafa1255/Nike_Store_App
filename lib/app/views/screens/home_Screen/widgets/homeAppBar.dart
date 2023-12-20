import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../widgets/CustomCartIcon.dart';
import '../../../widgets/HsizedBox.dart';

PreferredSizeWidget homeAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: AppColors.kOfWhiteColor,
    leading: Builder(
      builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Image.asset(AppImages.iconhomeleading)),
    ),
    toolbarHeight: 60.h,
    centerTitle: true,
    title: SizedBox(
      width: 150.w,
      height: 50.h,
      child: Stack(
        children: [
          Positioned(
            left: 18.w,
            top: 8.h,
            child: Text(
              "Explore",
              style: Txtstyle.style32(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(AppImages.iconHomeappBarIcon)),
        ],
      ),
    ),
    actions: [
      CustomCartIcon(onPressed: () {
        GoRouter.of(context).push(Approuter.mycartscreen);
      }),
      HsizedBox(width: 15.w)
    ],
  );
}
