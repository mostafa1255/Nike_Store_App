import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/widgets/CustomHeaderofHomeItemListView.dart';
import '../../../../core/Functions/filterInBottomSheetFunction.dart';
import 'NewArrivalsBlocBuilder.dart';
import 'SearchBlocBuilder.dart';
import 'SliderPriceFilter.dart';
import 'TabBarWidget.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  RangeValues values = RangeValues(10, 90);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 16.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SearchBlocBuilder(),
              GestureDetector(
                onTap: () => filterInBottomSheetFunction(context),
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 35.r,
                    child: Image.asset(AppImages.iconFilter)),
              ),
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
          const NewArrivalsBlocBuilder()
        ],
      )),
    ));
  }
}
