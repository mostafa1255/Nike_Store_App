import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';
import 'CustomAlertDialog.dart';

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
          const CustomBackAndFavIcon(),
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
                  return const CustomAlertDialog();
                },
              );
            },
          ),
        ],
      )),
    ));
  }
}
