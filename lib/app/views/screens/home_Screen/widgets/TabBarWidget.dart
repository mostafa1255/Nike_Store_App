import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'AllShoes_BlocBuilder_BlocListener_ListView.dart';
import 'OutDoorBlocBuilder_BlocListener_ListView.dart';
import 'Tennis_BlocBuilder_BlocListener_ListView.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            splashBorderRadius: BorderRadius.circular(10.r),
            physics: const BouncingScrollPhysics(),
            dividerHeight: 0,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kPrimaryColor),
            labelColor: Colors.white,
            labelStyle: Txtstyle.style12(context: context),
            unselectedLabelColor: AppColors.kFontColor,
            tabs: const [
              Tab(text: 'All Shoes'),
              Tab(text: 'Outdoor'),
              Tab(text: 'Tennis'),
            ],
          ),
          SizedBox(
            height: 330.h,
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: const TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  // Content for Header 1
                  AllShoes_BlocBuilder_BlocListener_ListView(),
                  // Content for Header 2
                  OutDoorBlocBuilder_BlocListener_ListView(),
                  // Content for Header 3
                  Tennis_BlocBuilder_BlocListener_ListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
