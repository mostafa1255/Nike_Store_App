import 'package:flutter/material.dart';
import 'package:nike_store_app/app/views/common_widgets/HsizedBox.dart';

import '../../../core/utils/AppFonts.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomBackIcon.dart';
import 'widgets/SerachScreenBody.dart';

class SerachScreen extends StatelessWidget {
  const SerachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {}),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cancel",
              style: Txtstyle.style15(context: context).copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFonts.relwayFamily),
            ),
          ),
          HsizedBox(width: 10)
        ],
        centerTitle: true,
        title: Text(
          "Search",
          style: Txtstyle.style20(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.relwayFamily),
        ),
      ),
      body: const SerachScreenBody(),
    );
  }
}
