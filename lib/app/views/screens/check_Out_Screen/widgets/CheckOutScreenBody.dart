import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import '../../../../core/styles/App_Colors.dart';

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
                  SizedBox(
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
                            color: AppColors.kDeepGreyColor,
                            fontFamily: Constants.popinsFamily),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppImages.iconEdit)),
                    ),
                  ),
                  SizedBox(
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
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppImages.iconEdit)),
                    ),
                  ),
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
                          color: AppColors.kDeepGreyColor.withOpacity(0.7),
                          fontFamily: Constants.popinsFamily),
                    ),
                  ),
                  const VsizedBox(height: 15),
                  Container(
                    width: 320.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image: const AssetImage(AppImages.imageMap),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View Map",
                          style: Txtstyle.style20(context: context).copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: Constants.relwayFamily),
                        ),
                        const VsizedBox(height: 5),
                        CircleAvatar(
                          radius: 22.r,
                          backgroundColor: AppColors.kPrimaryColor,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on_rounded,
                                size: 25.sp,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
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
