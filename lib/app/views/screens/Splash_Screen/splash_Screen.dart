import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Image.asset(AppImages.imagesNikeSplashScreen),
    );
  }

  void _navigateToHomePage() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      GoRouter.of(context).push(Approuter.pageview);
    });
  }
}
