import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              AppImages.lottieSuccessAnimation,
              width: 300.w,
              height: 350.h,
            ),
            Text(
              'Payment Successful!',
              style: Txtstyle.style20(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            Text(
              'Your order will be delivered soon.',
              style: Txtstyle.style16(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            Text(
              'Thank you for your purchase.',
              style: Txtstyle.style16(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            const VsizedBox(height: 100),
            CustomMainButton(
                color: AppColors.kPrimaryColor,
                txt: 'Continue Shopping',
                fcolorWhite: true,
                width: 300.w,
                onPressed: () {
                  GoRouter.of(context).push(Approuter.homescreen);
                }),
          ],
        ),
      ),
    );
  }
}
