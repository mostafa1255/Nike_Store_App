import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';
import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/App_Image.dart';
import '../../../core/styles/text_Style.dart';
import '../../widgets/CustomBackIcon.dart';
import '../auth/widgets/CustomAlertDialog.dart';
import '../my_cart_Screen/widgets/BottomNavBarOfMyCartScreen.dart';
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

class CheckOutAlertDialog extends StatelessWidget {
  const CheckOutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(25.r), // Adjust the border radius as needed
      ),
      title: CircleAvatar(
        radius: 57.r,
        backgroundColor: const Color(0xffDFEFFF),
        child: Image.asset(
          AppImages.imagecheckOutSucsess,
          width: 65.w,
          height: 70.h,
          fit: BoxFit.fill,
        ),
      ),
      content: SizedBox(
        width: double.infinity,
        height: 170.h,
        child: Column(
          children: [
            const VsizedBox(height: 15),
            SizedBox(
              width: 170.w,
              child: Text(
                "Your Payment Is Successful",
                textAlign: TextAlign.center,
                style: Txtstyle.style20(context: context).copyWith(
                    color: AppColors.kFontColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: Constants.relwayFamily),
              ),
            ),
            const VsizedBox(height: 20),
            CustomMainButton(
              color: AppColors.kPrimaryColor,
              txt: "Back To Shopping",
              fcolorWhite: true,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
