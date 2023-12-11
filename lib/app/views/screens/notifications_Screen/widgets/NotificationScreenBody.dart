import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import 'RecentListViewInNotificationScreen.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent",
            textAlign: TextAlign.center,
            style: Txtstyle.style18(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w600,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 15),
          const RecentListViewInNotificationScreen(),
          Text(
            "Yesterday",
            textAlign: TextAlign.center,
            style: Txtstyle.style18(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w600,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 15),
          const RecentListViewInNotificationScreen(),
        ],
      )),
    ));
  }
}
