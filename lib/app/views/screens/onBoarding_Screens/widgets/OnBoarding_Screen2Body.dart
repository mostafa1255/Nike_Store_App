import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';

class OnBoardingScreen2Body extends StatelessWidget {
  const OnBoardingScreen2Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            AppImages.imagesOnboard2,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 295.h,
            left: 45.w,
            child: SizedBox(
              width: 300.w,
              child: Text("Let's Start Journey With Nike",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style30(context: context)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
            bottom: 230.h,
            left: 45.w,
            child: SizedBox(
              width: 300.w,
              child: Text("Smart, Gorgeous & Fashionable Collection Explor Now",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style16(context: context)
                      .copyWith(color: Colors.white.withOpacity(0.7))),
            ),
          ),
          Positioned(
              left: 10.w,
              bottom: 60.h,
              child: CustomMainButton(
                color: Colors.white,
                txt: "Next",
              )),
        ],
      ),
    );
  }
}
