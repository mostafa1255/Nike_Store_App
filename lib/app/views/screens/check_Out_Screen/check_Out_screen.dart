import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../common_widgets/CustomBackIcon.dart';
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
              return CheckOutAlertDialog(
                onPressed: () {
                  GoRouter.of(context).push(Approuter.homescreen);
                },
              );
            },
          );
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
