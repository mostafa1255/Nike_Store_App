import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/utils/AppFonts.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';

class CustomMainButton extends StatelessWidget {
  CustomMainButton({
    super.key,
    this.txt,
    this.onPressed,
    required this.color,
    this.widget,
    this.fcolorWhite,
    this.width,
  });
  final double? width;
  final String? txt;
  final void Function()? onPressed;
  final Color color;
  final Widget? widget;
  final bool? fcolorWhite;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shadowColor: const MaterialStatePropertyAll<Color>(Colors.white),
            backgroundColor: MaterialStatePropertyAll(color),
            fixedSize:
                MaterialStatePropertyAll(Size(width ?? double.infinity, 55.h)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.r)))),
        onPressed: onPressed,
        child: widget ??
            Text(
              txt!,
              style: Txtstyle.style14(context: context).copyWith(
                  color:
                      fcolorWhite == true ? Colors.white : AppColors.kFontColor,
                  fontFamily: AppFonts.relwayFamily),
            ));
  }
}
