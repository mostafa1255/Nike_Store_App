import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.securPass,
    this.stringController,
    required this.width,
    required this.height, this.widget,
  });
  final bool securPass;
  final TextEditingController? stringController;
  final double width;
  final double height;
  final String hinttext;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: stringController,
        obscureText: securPass,
        decoration: InputDecoration(
            suffixIcon: widget,
            fillColor: const Color(0xffF7F7F9),
            filled: true,
            hintText: hinttext,
            hintStyle: Txtstyle.style14(
              context: context,
            ).copyWith(color: AppColors.kDeepGreyColor),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r))),
      ),
    );
  }
}
