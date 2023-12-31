import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';

class CheckOutEmailListTile extends StatelessWidget {
  const CheckOutEmailListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        leading: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10.r)),
          child: Image.asset(AppImages.iconemail2),
        ),
        title: Text(
          "emmanueloyiboke@gmail.com",
          style: Txtstyle.style14(context: context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kSecondFontColor,
              fontFamily: Constants.popinsFamily),
        ),
        subtitle: Text(
          "Email",
          style: Txtstyle.style12(context: context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kDeepGreyColorA6A,
              fontFamily: Constants.popinsFamily),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: Image.asset(AppImages.iconEdit)),
      ),
    );
  }
}
