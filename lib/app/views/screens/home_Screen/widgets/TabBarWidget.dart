import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import 'CustomHeaderofHomeItemListView.dart';
import 'CustomHomeCardListView.dart';

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
              Tab(
                text: 'All Shoes',
              ),
              Tab(text: 'Outdoor'),
              Tab(text: 'Tennis'),
            ],
          ),
          SizedBox(
            height: 330.h,
            child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      const CustomHeaderofHomeItemListView(
                        popularOrNewarrival: 'Popular Shoes',
                      ),
                      const VsizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(Approuter.detailsscreen);
                        },
                        child: const CustomHomeCardListView(),
                      )
                    ],
                  ),
                  // Content for Header 2
                  Column(
                    children: [
                      const CustomHeaderofHomeItemListView(
                          popularOrNewarrival: "Popular Shoes"),
                      const VsizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(Approuter.detailsscreen);
                        },
                        child: const CustomHomeCardListView(),
                      )
                    ],
                  ),
                  // Content for Header 3
                  Column(
                    children: [
                      const CustomHeaderofHomeItemListView(
                          popularOrNewarrival: "Popular Shoes"),
                      const VsizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(Approuter.detailsscreen);
                        },
                        child: const CustomHomeCardListView(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
