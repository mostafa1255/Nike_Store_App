import 'package:flutter/material.dart';
import '../../../../core/utils/AppFonts.dart';
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          popularOrNewarrival,
          style: Txtstyle.style16(context: context).copyWith(
              fontFamily: AppFonts.relwayFamily, color: AppColors.kFontColor),
        ),
      ],
    );
  }
}
