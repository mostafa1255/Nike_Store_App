import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../widgets/CustomBackIcon.dart';
import '../my_cart_Screen/widgets/BottomNavBarOfMyCartScreen.dart';
import 'widgets/CheckOutAlertDialog.dart';
import 'widgets/CheckOutScreenBody.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarOfMyCartScreen(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CheckOutAlertDialog();
            },
          );
        },
      ),
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {}),
        centerTitle: true,
        title: Text(
          "Check Out",
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
