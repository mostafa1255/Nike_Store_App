import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/screens/details_Screen/widgets/DetailsScreenBody.dart';
import 'package:nike_store_app/app/views/widgets/CustomBackIcon.dart';
import 'package:nike_store_app/app/views/widgets/CustomCartIcon.dart';
import '../../widgets/HsizedBox.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackIcon(onPressed: () {
          calcSizeImage();
        }),
        title: Text(
          "Sneaker Shop",
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w500,
              fontFamily: Constants.relwayFamily),
        ),
        centerTitle: true,
        actions: [
          CustomCartIcon(
            onPressed: () {},
          ),
          HsizedBox(width: 15.w)
        ],
      ),
      body: const DetailsScreenBody(),
    );
  }
}
