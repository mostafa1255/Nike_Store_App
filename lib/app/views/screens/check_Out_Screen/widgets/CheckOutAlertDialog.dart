import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';

import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../common_widgets/VsizedBox.dart';
import '../../../common_widgets/customMainButton.dart';

class CheckOutAlertDialog extends StatelessWidget {
  const CheckOutAlertDialog({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(25.r), // Adjust the border radius as needed
      ),
      title: CircleAvatar(
        radius: 57.r,
        backgroundColor: const Color(0xffDFEFFF),
        child: Image.asset(
          AppImages.imagecheckOutSucsess,
          width: 65.w,
          height: 70.h,
          fit: BoxFit.fill,
        ),
      ),
      content: SizedBox(
        width: double.infinity,
        height: 170.h,
        child: Column(
          children: [
            const VsizedBox(height: 15),
            SizedBox(
              width: 170.w,
              child: Text(
                "Your Payment Is Successful",
                textAlign: TextAlign.center,
                style: Txtstyle.style20(context: context).copyWith(
                    color: AppColors.kFontColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.relwayFamily),
              ),
            ),
            const VsizedBox(height: 20),
            CustomMainButton(
              color: AppColors.kPrimaryColor,
              txt: "Back To Shopping",
              fcolorWhite: true,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
