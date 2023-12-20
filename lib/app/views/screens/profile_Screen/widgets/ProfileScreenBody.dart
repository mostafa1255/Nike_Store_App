import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomTextFormField.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

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
              child: Stack(
            children: [
              CircleAvatar(
                radius: 50.r,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 13.r,
                  backgroundColor: AppColors.kPrimaryColor,
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).push(Approuter.editprofilescreen);
                      },
                      icon: Icon(
                        FontAwesomeIcons.pen,
                        size: 10.sp,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          )),
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
            enableWriting: false,
            hinttext: "Mostafa Yasser",
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
            enableWriting: false,
            hinttext: "XYZ@gmail.com",
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
            enableWriting: false,
            hinttext: "01289880177",
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
