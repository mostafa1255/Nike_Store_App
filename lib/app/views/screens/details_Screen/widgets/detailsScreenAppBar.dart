import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/views/widgets/HsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/CustomCartIcon.dart';

AppBar detailsScreenAppBar(BuildContext context) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.kOfWhiteColor,
      leading: CustomBackAndFavIcon(
        onPressed: () {},
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
          onPressed: () {},
        ),
        HsizedBox(width: 15.w)
      ]);
}
