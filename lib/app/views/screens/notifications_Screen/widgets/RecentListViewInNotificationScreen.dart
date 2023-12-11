import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/VsizedBox.dart';

class RecentListViewInNotificationScreen extends StatelessWidget {
  const RecentListViewInNotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (itemBuilder, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Container(
              width: double.infinity,
              height: 110.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Row(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              AppImages.imagenikeshoes,
                            )),
                        color: Colors.grey.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 235.w,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "7 min ago",
                              textAlign: TextAlign.center,
                              style: Txtstyle.style14(context: context)
                                  .copyWith(
                                      color: AppColors.kGreyColorB81,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: Constants.popinsFamily),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160.w,
                          child: Text(
                            "We Have New Products With Offers",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Txtstyle.style14(context: context).copyWith(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: Constants.relwayFamily),
                          ),
                        ),
                        const VsizedBox(height: 5),
                        SizedBox(
                          width: 200.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                " \$350",
                                style: Txtstyle.style14(context: context)
                                    .copyWith(
                                        color: AppColors.kFontColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: Constants.popinsFamily),
                              ),
                              const HsizedBox(width: 0),
                              Text(
                                " \$200",
                                style: Txtstyle.style14(context: context)
                                    .copyWith(
                                        color: AppColors.kGreyColorB81,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: Constants.popinsFamily),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
