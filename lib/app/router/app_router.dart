import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/views/screens/onBoarding_Screens/onBoarding_Screen1.dart';

abstract class Approuter {
  static const onboarding = "/";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoarding_Screen1(),
      ),
    ],
  );
}
