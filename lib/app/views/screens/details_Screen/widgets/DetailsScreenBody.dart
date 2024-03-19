import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/FavoriteIconAction.dart';
import 'package:nike_store_app/app/views/common_widgets/HsizedBox.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';
import '../../../../data/models/Products_Model.dart';
import 'MorerelevantShoesListViewInDetailsScreen.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220.w,
            child: Text(
              "Nike Air Max 270 Essential",
              style: Txtstyle.style26(context: context)
                  .copyWith(color: AppColors.kFontColor),
            ),
          ),
          const VsizedBox(height: 10),
          SizedBox(
            width: 220.w,
            child: Text(
              "Men's Shoes",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kGreyColorB81,
                  fontFamily: Constants.relwayFamily),
            ),
          ),
          const VsizedBox(height: 7),
          Text(
            "\$ 200",
            style: Txtstyle.style24(context: context).copyWith(
                color: AppColors.kFontColor,
                fontFamily: Constants.popinsFamily),
          ),
          Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    left: 95.w,
                    bottom: 0.h,
                    child: Container(
                      width: 160.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0, 2),
                              spreadRadius: 0)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 190.h,
                      width: 375.w,
                      child: Image.asset(
                        AppImages.imagenikeshoes3,
                        fit: BoxFit.cover,
                      )),
                ],
              )),
          const VsizedBox(height: 60),
          const MorerelevantShoesListViewInDetailsScreen(),
          const VsizedBox(height: 20),
          Text(
            "The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike",
            style: Txtstyle.style14(context: context).copyWith(
                color: AppColors.kGreyColorB81.withOpacity(0.8),
                fontFamily: Constants.popinsFamily),
          ),
          const VsizedBox(height: 55),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const HsizedBox(width: 0),
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.kDeepGreyColorA6A.withOpacity(0.08),
                child: FavoriteIconAction(
                  favProduct: ProductsModel(
                      id: "d",
                      brand: "brand ",
                      name: "name",
                      price: "200",
                      imageUrl: "",
                      description: "description"),
                ),
              ),
              const HsizedBox(width: 25),
              CustomMainButton(
                onPressed: () {},
                width: 210.w,
                color: AppColors.kPrimaryColor,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HsizedBox(width: 5),
                    SizedBox(
                      width: 20.w,
                      height: 30.h,
                      child: Image.asset(
                        AppImages.iconcart,
                        color: Colors.white,
                      ),
                    ),
                    const HsizedBox(width: 10),
                    Text(
                      "Add to Cart",
                      style: Txtstyle.style14(context: context).copyWith(
                          color: Colors.white,
                          fontFamily: Constants.relwayFamily),
                    ),
                    const HsizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
          const VsizedBox(height: 25),
        ],
      )),
    ));
  }
}

void calcSizeImage() async {
  File imageFile = File('Hero Image.png');
  if (imageFile.existsSync()) {
    // The file exists, proceed with reading it.
    var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
    print(decodedImage.width);
    print(decodedImage.height);
    // Rest of your code...
  } else {
    print('File does not exist: ${imageFile.path}');
  }
}
