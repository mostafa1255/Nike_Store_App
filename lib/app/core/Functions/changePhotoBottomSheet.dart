import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../data/manager/image_picker_cubit/image_picker_cubit.dart';
import '../../views/common_widgets/VsizedBox.dart';
import '../../views/common_widgets/customMainButton.dart';
import '../styles/App_Colors.dart';

dynamic changePhotoBottomSheet(BuildContext context) {
  var imagePickerCubit = BlocProvider.of<ImagePickerCubit>(context);
  return showBottomSheet(
    backgroundColor: AppColors.kOfWhiteColor,
    context: context,
    builder: (context) {
      return SizedBox(
        height: 200.h,
        width: 375.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.cancel,
                      size: 25.sp,
                      color: AppColors.kPrimaryColor,
                    )),
              ),
            ),
            CustomMainButton(
              onPressed: () {
                imagePickerCubit.getImageFromCameraAndUploadtoStorage();
              },
              fcolorWhite: true,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Take Photo",
            ),
            const VsizedBox(height: 10),
            CustomMainButton(
              onPressed: () {
                imagePickerCubit.getImageFromGalleryAndUploadtoStorage();
              },
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Choose Photo",
              fcolorWhite: true,
            )
          ],
        ),
      );
    },
  );
}
