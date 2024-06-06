import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomCartIcon.dart';

import '../../../../core/styles/App_Colors.dart';
import '../../../../router/app_router.dart';
import '../../../common_widgets/CustomBackIcon.dart';
import '../../../common_widgets/HsizedBox.dart';

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    required bool witerColor}) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: witerColor ? Colors.white : AppColors.kOfWhiteColor,
      leading: CustomBackAndFavIcon(
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: Txtstyle.style16(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w500,
        ),
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
