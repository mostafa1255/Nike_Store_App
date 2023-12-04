import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';

class NewArrivalsAndOffersHomeListView extends StatelessWidget {
  const NewArrivalsAndOffersHomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 150.h,
          child: Center(
            child: Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summer Sale",
                      style: Txtstyle.style12(context: context).copyWith(
                          color: AppColors.kFontColor,
                          fontFamily: Constants.relwayFamily),
                    ),
                    Text(
                      "15 % OFF",
                      style: Txtstyle.style34(context: context).copyWith(
                        color: AppColors.kpurpleColor,
                        fontFamily: Constants.alfaSlabOne,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            right: 20.w,
            top: -3,
            child: SizedBox(
              width: 120.w,
              height: 120.h,
              child: Image.asset(AppImages.imageshoes2),
            )),
        Positioned(
            bottom: 25.h,
            right: 25.w,
            child: SizedBox(
              width: 100.w,
              height: 30.h,
              child: Image.asset(AppImages.imageshadowshoes),
            )),
        Positioned(
            bottom: 35.h,
            left: 10.w,
            child: SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AppImages.iconstarhome),
            )),
        Positioned(
            top: 30.h,
            left: 150.w,
            child: SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AppImages.iconstarhome),
            )),
        Positioned(
            bottom: 30.h,
            right: 140.w,
            child: SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AppImages.iconstarhome),
            )),
        Positioned(
            top: 35.h,
            right: 0.w,
            child: SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(AppImages.iconstarhome),
            )),
      ],
    );
  }
}
