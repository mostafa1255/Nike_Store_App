import 'package:flutter/material.dart';
import '../../../core/styles/App_Colors.dart';
import 'widgets/EditProfileScreenBody.dart';
import 'widgets/profileScreenAppBar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: profileScreenAppBar(context),
      body: const EditProfileScreenBody(),
    );
  }
}

