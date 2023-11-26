import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';

class CustomMainButton extends StatelessWidget {
  CustomMainButton({
    super.key,
    required this.txt,
    this.onPressed,
    required this.color,
    this.width = 335,
  });

  final String txt;
  final void Function()? onPressed;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(color),
            minimumSize: MaterialStatePropertyAll(Size(width.w, 55.h)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.r)))),
        onPressed: onPressed,
        child: Text(
          txt,
          style: Txtstyle.style14(context: context).copyWith(
              color: AppColors.kFontColor, fontFamily: Constants.relwayFamily),
        ));
  }
}
