import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerListView() {
  return SizedBox(
    width: double.infinity,
    height: 150.h,
    child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Container(
            width: 300.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        )),
  );
}
