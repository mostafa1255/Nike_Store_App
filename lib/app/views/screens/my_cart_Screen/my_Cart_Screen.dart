import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/widgets/CustomBackIcon.dart';
import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import 'widgets/BottomNavBarOfMyCartScreen.dart';
import 'widgets/MyCartScreenBody.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarOfMyCartScreen(
        onPressed: () {
          GoRouter.of(context).push(Approuter.checkoutscreen);
        },
      ),
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {
          GoRouter.of(context).pop();
        }),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w500,
              fontFamily: Constants.relwayFamily),
        ),
      ),
      body: MyCartScreenBody(),
    );
  }
}
