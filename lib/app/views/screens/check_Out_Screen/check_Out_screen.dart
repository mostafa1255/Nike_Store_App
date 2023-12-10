import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../widgets/CustomBackIcon.dart';
import '../my_cart_Screen/widgets/BottomNavBarOfMyCartScreen.dart';
import 'widgets/CheckOutScreenBody.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarOfMyCartScreen(),
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {}),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w500,
              fontFamily: Constants.relwayFamily),
        ),
      ),
      body: const CheckOutScreenBody(),
    );
  }
}
