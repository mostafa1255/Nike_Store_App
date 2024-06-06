import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomTextFormField.dart';
import '../../../../data/models/User_Model.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key, required this.userModel});
  final UserModel userModel;

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
              userModel.imageUrl == null
                  ? CircleAvatar(
                      radius: 50.r,
                    )
                  : CircleAvatar(
                      radius: 50.r,
                      backgroundImage:
                          CachedNetworkImageProvider(userModel.imageUrl!),
                    ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: AppColors.kPrimaryColor,
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).push(Approuter.editprofilescreen,
                            extra: userModel);
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
                fontFamily: AppFonts.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            enableWriting: false,
            hinttext: userModel.name,
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
                fontFamily: AppFonts.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            enableWriting: false,
            hinttext: userModel.email,
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
                fontFamily: AppFonts.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            enableWriting: false,
            hinttext: userModel.phoneNumber.toString(),
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
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      )),
    ));
  }
}
