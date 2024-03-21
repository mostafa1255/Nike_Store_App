import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/App_Image.dart';

class CustomStarsInNewArrivals extends StatelessWidget {
  const CustomStarsInNewArrivals({
    super.key,
    required this.top,
    required this.right,
  });
  final double top;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top.h,
        right: right.w,
        child: SizedBox(
          width: 30.w,
          height: 30.h,
          child: Image.asset(AppImages.iconstarhome),
        ));
  }
}
