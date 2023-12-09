import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/widgets/HsizedBox.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';

class MyCartScreenBody extends StatefulWidget {
  MyCartScreenBody({super.key});

  @override
  State<MyCartScreenBody> createState() => _MyCartScreenBodyState();
}

class _MyCartScreenBodyState extends State<MyCartScreenBody> {
  final List<String> list = [
    "mostafa",
    "Yasser",
    "Abdlehamed",
    "mostafa",
    "Yasser",
    "Abdlehamed"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${list.length} Item",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontFamily: Constants.popinsFamily,
                fontWeight: FontWeight.w600),
          ),
          const VsizedBox(height: 15),
          ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Slidable(
                    startActionPane: ActionPane(
                      extentRatio: 0.23,
                      motion: const ScrollMotion(),
                      children: [
                        Container(
                          width: 65.w,
                          decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: 25.sp,
                                    color: Colors.white,
                                  )),
                              Flexible(
                                child: Text(
                                  "10",
                                  overflow: TextOverflow.ellipsis,
                                  style: Txtstyle.style14(context: context)
                                      .copyWith(
                                          fontFamily: Constants.relwayFamily,
                                          color: Colors.white.withOpacity(0.7)),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      extentRatio: 0.18,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          padding: EdgeInsets.all(5.sp),
                          borderRadius: BorderRadius.circular(10.r),
                          onPressed: (context) {
                            list.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: AppColors.kredColor,
                          foregroundColor: Colors.white,
                          icon: FontAwesomeIcons.trashCan,
                        ),
                      ],
                    ),
                    child: Container(
                        width: double.infinity,
                        height: 145.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Container(
                                width: 120.w,
                                height: 120.h,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.035),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Image.asset(
                                  AppImages.imagenikeshoes,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const HsizedBox(width: 55),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const VsizedBox(height: 0),
                                  Flexible(
                                    child: SizedBox(
                                      width: 130.w,
                                      child: Text(
                                        list[index],
                                        style:
                                            Txtstyle.style16(context: context)
                                                .copyWith(
                                          color: AppColors.kFontColor,
                                          fontFamily: Constants.relwayFamily,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "\$584.95",
                                      style: Txtstyle.style14(context: context)
                                          .copyWith(
                                              color: AppColors.kFontColor,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  Constants.popinsFamily,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const VsizedBox(height: 0),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              })
        ],
      )),
    ));
    ;
  }
}
