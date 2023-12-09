import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/views/screens/details_Screen/details_screen.dart';
import 'package:nike_store_app/app/views/screens/favorite_Screen/favorite_screen.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/home_screen.dart';
import 'package:nike_store_app/app/views/screens/my_cart_Screen/my_Cart_Screen.dart';
import 'package:nike_store_app/app/views/screens/onBoarding_Screens/onBoarding_Screen2.dart';
import 'package:nike_store_app/app/views/screens/onBoarding_Screens/onBoarding_Screen3%20copy.dart';
import '../views/widgets/DotcontrollerOnBoarding.dart';

abstract class Approuter {
  static const initial = "/";
  static const pageview = "/dotcontrolleronboarding";
  static const onboarding2 = "/onboarding2";
  static const onboarding3 = "/onboarding3";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initial,
        builder: (context, state) => MyCartScreen(),
      ),
      GoRoute(
        path: pageview,
        builder: (context, state) => DotcontrollerOnBoarding(),
      ),
      GoRoute(
        path: onboarding2,
        builder: (context, state) =>
            OnBoardingScreen2(controller: state.extra as PageController),
      ),
      GoRoute(
        path: onboarding3,
        builder: (context, state) =>
            OnBoardingScreen3(controller: state.extra as PageController),
      ),
    ],
  );
}
