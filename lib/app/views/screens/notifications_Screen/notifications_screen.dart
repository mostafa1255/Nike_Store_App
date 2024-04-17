import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/data/manager/fcm_cubit/fcm_cubit.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../router/app_router.dart';
import '../favorite_Screen/widgets/favoriteScreenAppBar.dart';
import 'widgets/NotificationScreenBody.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: favAndNotifScreenAppBar(context, "Notifications", () {
        if (GoRouter.of(context).canPop()) {
          GoRouter.of(context).pop();
        } else {
          GoRouter.of(context).push(Approuter.homescreen);
        }
      }, () async {
        await BlocProvider.of<FcmCubit>(context).deleteAllNotification();
        await BlocProvider.of<FcmCubit>(context).getFCMProducts();
      }, FontAwesomeIcons.trashCan),
      body: const NotificationScreenBody(),
    );
  }
}
