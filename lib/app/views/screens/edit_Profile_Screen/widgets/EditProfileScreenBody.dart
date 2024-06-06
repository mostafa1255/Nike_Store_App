import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/tools/save_user_info.dart';
import 'package:nike_store_app/app/data/manager/image_picker_cubit/image_picker_cubit.dart';
import '../../../../core/Functions/changePhotoBottomSheet.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../data/manager/user_cubit/user_cubit.dart';
import '../../../../data/models/User_Model.dart';
import '../../../common_widgets/CustomTextFormField.dart';
import '../../../common_widgets/VsizedBox.dart';
import '../../../common_widgets/customMainButton.dart';

class EditProfileScreenBody extends StatelessWidget {
  const EditProfileScreenBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    var userCubit = BlocProvider.of<UserCubit>(context);

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
                BlocBuilder<ImagePickerCubit, ImagePickerState>(
                  builder: (context, state) {
                    if (state is ImageSelectedSuccsess) {
                      userCubit.updateUserImageUrl(userImage: state.imageUrl);
                      SaveUserInfo.saveUserImageUrl(state.imageUrl);
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage:
                            CachedNetworkImageProvider(state.imageUrl),
                      );
                    }
                    return FutureBuilder(
                      future: SaveUserInfo.getUserImageUrl(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CircleAvatar(
                            radius: 50.r,
                            backgroundImage:
                                CachedNetworkImageProvider(snapshot.data!),
                          );
                        } else {
                          return CircleAvatar(
                            radius: 50.r,
                            backgroundColor: AppColors.kPrimaryColor,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                const VsizedBox(height: 10),
                Text(
                  userModel.name!,
                  style: Txtstyle.style20(context: context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kFontColor,
                      fontFamily: AppFonts.relwayFamily),
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
                        fontFamily: AppFonts.relwayFamily),
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
                fontFamily: AppFonts.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            initialValue: userModel.name,
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
            initialValue: userModel.email,
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
            initialValue: userModel.phoneNumber.toString(),
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
