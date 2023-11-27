import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';

import 'widgets/OnBoarding_Screen1Body.dart';

// ignore: camel_case_types
class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({
    super.key,
    required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        body: OnBoardingScreen1Body(
          controller: controller,
        ));
  }
}
