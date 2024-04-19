import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/save_user_info.dart';

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
        title: FutureBuilder(
          future: SaveUserInfo.getUserPhone(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "+20 ${snapshot.data!}",
                style: Txtstyle.style14(context: context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kSecondFontColor,
                    fontFamily: Constants.popinsFamily),
              );
            } else {
              return const Text("There is no Phone number");
            }
          },
        ),
        subtitle: Text(
          "Phone",
          style: Txtstyle.style12(context: context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kDeepGreyColorA6A,
              fontFamily: Constants.popinsFamily),
        ),
      ),
    );
  }
}
