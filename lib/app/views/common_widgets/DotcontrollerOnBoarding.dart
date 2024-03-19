import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/views/screens/onBoarding_Screens/onBoarding_Screen1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/onBoarding_Screens/onBoarding_Screen2.dart';
import '../screens/onBoarding_Screens/onBoarding_Screen3 copy.dart';

class DotcontrollerOnBoarding extends StatelessWidget {
  DotcontrollerOnBoarding({super.key});
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 812.h,
                child: PageView(
                  controller: controller,
                  children: [
                    OnBoardingScreen1(controller: controller),
                    OnBoardingScreen2(controller: controller),
                    OnBoardingScreen3(controller: controller)
                  ],
                ),
              ),
              Positioned(
                bottom: 190.h,
                left: 140.w,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 5.h,
                      activeDotColor: Colors.white,
                      dotColor: AppColors.kYellowColor,
                      expansionFactor: 1.7.w,
                      dotWidth: 23.w),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
