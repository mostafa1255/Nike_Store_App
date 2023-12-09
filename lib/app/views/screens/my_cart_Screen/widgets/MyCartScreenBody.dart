import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/widgets/HsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';

class MyCartScreenBody extends StatelessWidget {
  const MyCartScreenBody({super.key});

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
            "3 Item",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontFamily: Constants.popinsFamily,
                fontWeight: FontWeight.w600),
          ),
          Slidable(
            // key: key,
            startActionPane: ActionPane(
              extentRatio: 0.23,
              motion: const ScrollMotion(),
              children: [
                Container(
                  width: 65.w,
                  decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                      Text("1"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.minimize,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                Container(
                  width: 65.w,
                  decoration: BoxDecoration(
                      color: AppColors.kredColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ],
                  ),
                )
              ],
            ),
            child: Container(
                width: double.infinity,
                height: 120.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Container(
                        width: 105.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Image.asset(
                          AppImages.imagenikeshoes,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const HsizedBox(width: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "Nike Club Max",
                                style: Txtstyle.style16(context: context)
                                    .copyWith(
                                        color: AppColors.kFontColor,
                                        fontFamily: Constants.relwayFamily,
                                        fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "\$584.95",
                              style: Txtstyle.style14(context: context)
                                  .copyWith(
                                      color: AppColors.kFontColor,
                                      fontFamily: Constants.popinsFamily,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      )),
    ));
    ;
  }
}
