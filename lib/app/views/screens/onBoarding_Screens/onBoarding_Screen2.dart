import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'widgets/OnBoarding_Screen2Body.dart';

// ignore: camel_case_types
class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({
    super.key,
    required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        body: OnBoardingScreen2Body());
  }
}
