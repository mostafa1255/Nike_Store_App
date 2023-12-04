import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/widgets/CustomHeaderofHomeItemListView.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import 'NewArrivalsAndOffersHomeListView.dart';
import 'TabBarWidget.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
    "lamarin",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 16.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GFSearchBar(
                margin: EdgeInsets.only(right: 55.w),
                searchBoxInputDecoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                  hintText: "Looking for shoes",
                  hintStyle: Txtstyle.style12(context: context).copyWith(
                    color: AppColors.kDeepGreyColor,
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 10.r,
                          child: Image.asset(AppImages.iconserach))),
                ),
                searchList: list,
                searchQueryBuilder: (query, list) {
                  return list
                      .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                },
                overlaySearchListItemBuilder: (item) {
                  //this container is for search result
                  return Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Text(
                      item,
                      style: Txtstyle.style14(context: context).copyWith(
                          color: AppColors.kFontColor,
                          fontFamily: Constants.popinsFamily,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                },
                onItemSelected: (item) {
                  setState(() {
                    if (kDebugMode) {
                      print('$item');
                    }
                  });
                },
              ),
              Positioned(
                  right: 0.w,
                  top: 12.h,
                  child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 32.r,
                          child: Image.asset(AppImages.iconFilter))))
            ],
          ),
          const VsizedBox(height: 10),
          Text(
            "Select Category",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 15),
          const TabBarWidget(),
          const VsizedBox(height: 15),
          const CustomHeaderofHomeItemListView(
              popularOrNewarrival: "New Arrivals"),
          const VsizedBox(height: 0),
          const NewArrivalsAndOffersHomeListView()
        ],
      )),
    ));
  }
}
