import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerProductListViewHomeScreen extends StatelessWidget {
  const CustomShimmerProductListViewHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 230.h,
      child: ListView.builder(
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: SizedBox(
                height: 150.h,
                width: 180.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23.r),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
