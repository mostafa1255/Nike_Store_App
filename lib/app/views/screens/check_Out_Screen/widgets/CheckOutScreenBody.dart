import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import '../../../../core/styles/App_Colors.dart';
import 'CheckOutEmailListTile.dart';
import 'CheckOutPhoneListTile.dart';
import 'ViewUserLocationMap.dart';

class CheckOutScreenBody extends StatelessWidget {
  const CheckOutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 500.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 14.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Information",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kSecondFontColor,
                        fontFamily: Constants.relwayFamily),
                  ),
                  const CheckOutEmailListTile(),
                  const CheckOutPhoneListTile(),
                  Text(
                    "Address",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondFontColor,
                        fontFamily: Constants.relwayFamily),
                  ),
                  const VsizedBox(height: 10),
                  Flexible(
                    child: Text(
                      "1082 Airport Road, Nigeria",
                      style: Txtstyle.style12(context: context).copyWith(
                          fontWeight: FontWeight.w600,
                          //  overflow: TextOverflow.ellipsis,
                          color: AppColors.kDeepGreyColorA6A.withOpacity(0.7),
                          fontFamily: Constants.popinsFamily),
                    ),
                  ),
                  const VsizedBox(height: 15),
                  const ViewUserLocationMap(),
                  const VsizedBox(height: 15),
                  Text(
                    "Payment Method",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondFontColor,
                        fontFamily: Constants.relwayFamily),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}
