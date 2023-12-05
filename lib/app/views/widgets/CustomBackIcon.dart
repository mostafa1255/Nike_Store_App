import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(width: 6.w, color: AppColors.kOfWhiteColor)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        iconSize: 17.sp,
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
        ));
  }
}
