import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';

class CustomAuthHaveaccount extends StatelessWidget {
  const CustomAuthHaveaccount({
    super.key,
    required this.accountType,
    required this.createOrLogin,
  });
  final String accountType;
  final String createOrLogin;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountType,
          style: Txtstyle.style16(context: context).copyWith(
              fontFamily: Constants.relwayFamily,
              fontWeight: FontWeight.w300,
              color: AppColors.kDeepGreyColorA6A),
        ),
        Text(
          createOrLogin,
          style: Txtstyle.style16(context: context).copyWith(
              fontFamily: Constants.relwayFamily,
              fontWeight: FontWeight.w100,
              color: AppColors.kFontColor),
        )
      ],
    );
  }
}
