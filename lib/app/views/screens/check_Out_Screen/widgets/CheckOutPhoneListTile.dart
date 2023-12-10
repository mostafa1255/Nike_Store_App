import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';

class CheckOutPhoneListTile extends StatelessWidget {
  const CheckOutPhoneListTile({
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
          child: Image.asset(AppImages.iconPhone),
        ),
        title: Text(
          "+234-811-732-5298",
          style: Txtstyle.style14(context: context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kSecondFontColor,
              fontFamily: Constants.popinsFamily),
        ),
        subtitle: Text(
          "Phone",
          style: Txtstyle.style12(context: context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kDeepGreyColor,
              fontFamily: Constants.popinsFamily),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: Image.asset(AppImages.iconEdit)),
      ),
    );
  }
}
