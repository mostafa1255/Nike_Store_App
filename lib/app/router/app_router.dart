import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/data/manager/fcm_cubit/fcm_cubit.dart';
import 'package:nike_store_app/app/data/manager/user_cubit/user_cubit.dart';
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
import '../data/models/Products_Model.dart';
import '../data/repos/user_repo/user_repo_Impl.dart';
import '../views/common_widgets/DotcontrollerOnBoarding.dart';

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
      GoRoute(path: initial, builder: (context, state) => LoginScreen()),
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
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: detailsscreen,
        builder: (context, state) => DetailsScreen(
          productsModel: state.extra as ProductsModel,
        ),
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
        builder: (context, state) => BlocProvider(
          create: (context) => FcmCubit()..getFCMProducts(),
          child: const NotificationScreen(),
        ),
      ),
      GoRoute(
        path: favoritescreen,
        builder: (context, state) => FavoriteScreen(),
      ),
      GoRoute(
        path: checkoutscreen,
        builder: (context, state) => CheckOutScreen(
          subTotalPrice: state.extra as num,
        ),
      ),
    ],
  );
}
