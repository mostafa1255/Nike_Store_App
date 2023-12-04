import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';
import 'widgets/homeAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      drawer: const HomeDrawer(),
      appBar: homeAppBar(context),
      body: HomeScreenBody(),
    );
  }
}
