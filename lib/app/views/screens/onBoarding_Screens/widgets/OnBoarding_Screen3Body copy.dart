import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';

class OnBoardingScreen3Body extends StatelessWidget {
  const OnBoardingScreen3Body({Key? key, required this.controller})
      : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            AppImages.imagesOnboard3,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 295.h,
            left: 45.w,
            child: SizedBox(
              width: 300.w,
              child: Text("You Have the Power To",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style34(context: context)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
            bottom: 230.h,
            left: 45.w,
            child: SizedBox(
              width: 350.w,
              child: Text(
                  "There Are Many Beautiful And Attractive Plants To Your Room",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style16(context: context)
                      .copyWith(color: Colors.white.withOpacity(0.7))),
            ),
          ),
          Positioned(
              left: 18.w,
              bottom: 20.h,
              child: CustomMainButton(
                width: 340.w,
                color: Colors.white,
                txt: "Next",
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut);
                  GoRouter.of(context).push(Approuter.loginescreen);
                },
              )),
        ],
      ),
    );
  }
}
