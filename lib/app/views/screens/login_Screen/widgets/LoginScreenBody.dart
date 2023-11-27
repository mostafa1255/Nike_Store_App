import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/widgets/CustomTextFormField.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/VsizedBox.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 18.h, left: 14.w, right: 14.w),
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
          const VsizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Hello Again!",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              child: Text(
                "Fill your details or continue with social media",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColor),
              ),
            ),
          ),
          const VsizedBox(height: 35),
          Text(
            "Email Address",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 12),
          CustomTextFormField(
            hinttext: "xyz@gmail.com",
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 17),
          Text(
            "Password",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 12),
          CustomTextFormField(
            widget: IconButton(
                onPressed: () {}, icon: Image.asset(AppImages.iconeyePassword)),
            hinttext: "Password",
            securPass: true,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 3),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Recovery Password",
              style: Txtstyle.style12(context: context).copyWith(
                  color: AppColors.kGreyColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constants.popinsFamily),
            ),
          ),
          const VsizedBox(height: 25),
          CustomMainButton(
            fcolorWhite: true,
            txt: "Sign In",
            color: AppColors.kPrimaryColor,
            onPressed: () {},
          ),
          const VsizedBox(height: 25),
          CustomMainButton(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.iconGoogle),
                const HsizedBox(width: 15),
                Text(
                  "Sign In with Google ",
                  style: Txtstyle.style14(context: context).copyWith(
                      fontFamily: Constants.relwayFamily,
                      color: AppColors.kFontColor),
                )
              ],
            ),
            fcolorWhite: true,
            color: AppColors.kLightGreyColor,
            onPressed: () {},
          ),
          const VsizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New User?",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: Constants.relwayFamily,
                    fontWeight: FontWeight.w300,
                    color: AppColors.kDeepGreyColor),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Create Account",
                  style: Txtstyle.style16(context: context).copyWith(
                      fontFamily: Constants.relwayFamily,
                      fontWeight: FontWeight.w100,
                      color: AppColors.kFontColor),
                ),
              )
            ],
          )
        ],
      )),
    ));
  }
}
