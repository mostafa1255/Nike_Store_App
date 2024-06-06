import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/data/models/User_Model.dart';
import '../../../core/utils/AppFonts.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomBackIcon.dart';
import 'widgets/ProfileScreenBody.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {
          GoRouter.of(context).pop();
        }),
        centerTitle: true,
        title: Text(
          "Profile",
          style: Txtstyle.style20(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.relwayFamily),
        ),
      ),
      body: ProfileScreenBody(
        userModel: userModel,
      ),
    );
  }
}
