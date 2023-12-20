import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/widgets/CustomTextFormField.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/SecurePasswordTextField.dart';
import '../../../widgets/VsizedBox.dart';
import 'CustomAuthHaveaccount.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passController = TextEditingController();

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
            backgroundColor: AppColors.kOfWhiteColor,
            child: IconButton(
                iconSize: 17.sp,
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_rounded)),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Register Account",
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
                "Fill your details or continue with social media",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColorB81),
              ),
            ),
          ),
          const VsizedBox(height: 27),
          Text(
            "Your Name",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: nameController,
            hinttext: "x x x x x x x ",
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            "Email Address",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: emailController,
            hinttext: "xyz@gmail.com",
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            "Password",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          SecurePasswordTextField(passController: passController),
          const VsizedBox(height: 15),
          CustomMainButton(
            width: 375.w,
            fcolorWhite: true,
            txt: "Sign Up",
            color: AppColors.kPrimaryColor,
            onPressed: () {
              //      GoRouter.of(context).push(Approuter.homescreen);
            },
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
            color: AppColors.kOfWhiteColor,
            onPressed: () {},
          ),
          const VsizedBox(height: 20),
          CustomAuthHaveaccount(
            onTap: () {
              GoRouter.of(context).push(Approuter.loginescreen);
            },
            accountType: "Already Have Account?",
            createOrLogin: " Log In",
          )
        ],
      )),
    ));
  }
}
