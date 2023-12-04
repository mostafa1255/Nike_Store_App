import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';

class CustomHeaderofHomeItemListView extends StatelessWidget {
  const CustomHeaderofHomeItemListView({
    super.key,
    required this.popularOrNewarrival,
  });
  final String popularOrNewarrival;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          popularOrNewarrival,
          style: Txtstyle.style16(context: context).copyWith(
              fontFamily: Constants.relwayFamily, color: AppColors.kFontColor),
        ),
        Text(
          "See all",
          style: Txtstyle.style12(context: context).copyWith(
              fontFamily: Constants.popinsFamily,
              color: AppColors.kPrimaryColor),
        ),
      ],
    );
  }
}
