import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';

class MorerelevantShoesListViewInDetailsScreen extends StatelessWidget {
  const MorerelevantShoesListViewInDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 87.h,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 20.w, bottom: 10.h),
              child: Container(
                width: 70.w,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey.withOpacity(0.15),
                          offset: const Offset(0, 2),
                          spreadRadius: 0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.r)),
                child: Center(
                  child: SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: Image.asset(
                      AppImages.imageshoes2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
