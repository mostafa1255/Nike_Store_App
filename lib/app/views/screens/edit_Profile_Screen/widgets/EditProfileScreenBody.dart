import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/Functions/changePhotoBottomSheet.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.r,
                ),
                const VsizedBox(height: 10),
                Text(
                  "Emmanuel Oyiboke",
                  style: Txtstyle.style20(context: context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kFontColor,
                      fontFamily: Constants.relwayFamily),
                ),
                const VsizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    changePhotoBottomSheet(context);
                  },
                  child: Text(
                    "Change Profile Picture",
                    style: Txtstyle.style12(context: context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.kPrimaryColor,
                        fontFamily: Constants.relwayFamily),
                  ),
                ),
              ],
            ),
          ),
          const VsizedBox(height: 30),
          Text(
            "Your Name",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kGreyColorB81,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            initialValue: "Mostafa Yasser",
            fontcolor: AppColors.kFontColor,
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            "Email Address",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kGreyColorB81,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            initialValue: "XYZ@gmail.com",
            fontcolor: AppColors.kFontColor,
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            "Mobile Number",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kGreyColorB81,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            initialValue: "01289880177",
            securPass: false,
            fontcolor: AppColors.kFontColor,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 8),
          CustomMainButton(
            color: AppColors.kPrimaryColor,
            fcolorWhite: true,
            width: 375.w,
            txt: "Save Now",
            onPressed: () {},
          ),
        ],
      )),
    ));
  }
}
