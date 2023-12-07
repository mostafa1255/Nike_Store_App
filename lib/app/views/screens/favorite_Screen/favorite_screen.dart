import 'package:flutter/material.dart';
import '../../../core/styles/App_Colors.dart';
import 'widgets/FavoriteScreenBody.dart';
import 'widgets/favoriteScreenAppBar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: favoriteScreenAppBar(context),
      body: const FavoriteScreenBody(),
    );
  }
}
