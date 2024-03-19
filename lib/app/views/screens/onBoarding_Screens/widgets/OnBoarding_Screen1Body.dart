import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';

import '../../../../router/app_router.dart';

class OnBoardingScreen1Body extends StatelessWidget {
  const OnBoardingScreen1Body({Key? key, required this.controller})
      : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            AppImages.imagesOnboarding1,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 645.h,
            left: 70.w,
            child: SizedBox(
              width: 220.w,
              child: Text("WELLCOM TO NIKE",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style30(context: context)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
              left: 18.w,
              bottom: 60.h,
              child: CustomMainButton(
                color: Colors.white,
                width: 340.w,
                txt: "Get Started",
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut);
                },
              )),
        ],
      ),
    );
  }
}
