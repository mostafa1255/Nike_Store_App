import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kLightGreyColor,
            child: IconButton(
                iconSize: 17.sp,
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_rounded)),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Forgot Password",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              child: Text(
                "Enter your Email account to reset your password",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColor),
              ),
            ),
          ),
          const VsizedBox(height: 27),
          CustomTextFormField(
            hinttext: "x x x x x x x ",
            securPass: true,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 40),
          CustomMainButton(
            fcolorWhite: true,
            txt: "Reset password",
            color: AppColors.kPrimaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // Call your custom AlertDialog widget
                  return CustomAlertDialog();
                },
              );
            },
          ),
        ],
      )),
    ));
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(25.r), // Adjust the border radius as needed
      ),
      title: CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColors.kPrimaryColor,
        child: Image.asset(AppImages.iconEmail),
      ),
      content: SizedBox(
        height: 88.h,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Check your email",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 10),
            SizedBox(
              width: 230.w,
              child: Text(
                "We have send password recovery code in your email",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context).copyWith(
                    color: AppColors.kGreyColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constants.popinsFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
