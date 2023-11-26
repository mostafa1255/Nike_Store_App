import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';

class OnBoardingScreen1Body extends StatelessWidget {
  const OnBoardingScreen1Body({Key? key}) : super(key: key);

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
            bottom: 655.h,
            left: 77.w,
            child: SizedBox(
              width: 220.w,
              child: Text("WELLCOM TO NIKE",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style30(context: context)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
              left: 10.w,
              bottom: 60.h,
              child: CustomMainButton(
                color: Colors.white,
                txt: "Get Started",
              )),
        ],
      ),
    );
  }
}
