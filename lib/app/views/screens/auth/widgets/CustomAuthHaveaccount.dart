import 'package:flutter/material.dart';

import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';

class CustomAuthHaveaccount extends StatelessWidget {
  const CustomAuthHaveaccount({
    super.key,
    required this.accountType,
    required this.createOrLogin,
    this.onTap,
  });
  final String accountType;
  final String createOrLogin;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountType,
          style: Txtstyle.style16(context: context).copyWith(
              fontFamily: AppFonts.relwayFamily,
              fontWeight: FontWeight.w300,
              color: AppColors.kDeepGreyColorA6A),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            createOrLogin,
            style: Txtstyle.style16(context: context).copyWith(
                fontFamily: AppFonts.relwayFamily,
                fontWeight: FontWeight.w100,
                color: AppColors.kFontColor),
          ),
        )
      ],
    );
  }
}
