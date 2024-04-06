import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/styles/App_Colors.dart';
import '../favorite_Screen/widgets/favoriteScreenAppBar.dart';
import 'widgets/NotificationScreenBody.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: favAndNotifScreenAppBar(
          context, "Notifications", () {}, () {}, FontAwesomeIcons.trashCan),
      body: const NotificationScreenBody(),
    );
  }
}
