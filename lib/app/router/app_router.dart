import 'package:go_router/go_router.dart';
import '../views/widgets/DotcontrollerOnBoarding.dart';

abstract class Approuter {
  static const onboarding = "/";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => DotcontrollerOnBoarding(),
      ),
    ],
  );
}
