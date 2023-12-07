import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/views/screens/details_Screen/widgets/DetailsScreenBody.dart';
import 'widgets/detailsScreenAppBar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: detailsScreenAppBar(context),
      body: const DetailsScreenBody(),
    );
  }
}

