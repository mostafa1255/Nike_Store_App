import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/views/screens/Splash_Screen/splash_Screen.dart';
import 'package:nike_store_app/app/views/screens/auth/forget_password_Screen.dart';
import 'package:nike_store_app/app/views/screens/auth/login_screen.dart';
import 'package:nike_store_app/app/views/screens/auth/register_screen.dart';
import 'package:nike_store_app/app/views/screens/check_Out_Screen/check_Out_screen.dart';
import 'package:nike_store_app/app/views/screens/details_Screen/details_screen.dart';
import 'package:nike_store_app/app/views/screens/edit_Profile_Screen/edit_profile_screen.dart';
import 'package:nike_store_app/app/views/screens/favorite_Screen/favorite_screen.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/home_screen.dart';
import 'package:nike_store_app/app/views/screens/my_cart_Screen/my_Cart_Screen.dart';
import 'package:nike_store_app/app/views/screens/notifications_Screen/notifications_screen.dart';
import 'package:nike_store_app/app/views/screens/profile_Screen/profile_screen.dart';
import '../views/widgets/DotcontrollerOnBoarding.dart';

abstract class Approuter {
  static const initial = "/";
  static const pageview = "/dotcontrolleronboarding";
  static const loginescreen = "/loginescreen";
  static const registerscreen = "/registerscreen";
  static const forgetpasswordscreen = "/forgetpasswordscreen";
  static const homescreen = "/homescreen";
  static const detailsscreen = "/detailsscreen";
  static const mycartscreen = "/mycartscreen";
  static const profilescreen = "/profilescreen";
  static const editprofilescreen = "/editprofilescreen";
  static const notificationscreen = "/notificationscreen";
  static const favoritescreen = "/favoritescreen";
  static const checkoutscreen = "/checkoutscreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initial,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: pageview,
        builder: (context, state) => DotcontrollerOnBoarding(),
      ),
      GoRoute(
        path: loginescreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: forgetpasswordscreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: homescreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: detailsscreen,
        builder: (context, state) => DetailsScreen(),
      ),
      GoRoute(
        path: mycartscreen,
        builder: (context, state) => MyCartScreen(),
      ),
      GoRoute(
        path: profilescreen,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: editprofilescreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: notificationscreen,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: favoritescreen,
        builder: (context, state) => FavoriteScreen(),
      ),
      GoRoute(
        path: checkoutscreen,
        builder: (context, state) => CheckOutScreen(),
      ),
    ],
  );
}
