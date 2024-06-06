 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../common_widgets/CustomBackIcon.dart';

AppBar checkOutAppBar(BuildContext context) {
    return AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {
          GoRouter.of(context).pop();
        }),
        centerTitle: true,
        title: Text(
          "Check Out",
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.relwayFamily),
        ),
      );
  }