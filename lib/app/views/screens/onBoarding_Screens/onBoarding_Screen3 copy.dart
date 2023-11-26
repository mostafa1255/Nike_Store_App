import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'widgets/OnBoarding_Screen3Body copy.dart';

// ignore: camel_case_types
class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({
    super.key,
    required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        body: OnBoardingScreen3Body());
  }
}
