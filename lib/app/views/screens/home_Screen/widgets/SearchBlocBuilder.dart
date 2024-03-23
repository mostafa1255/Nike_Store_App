import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../data/manager/home_cubits/home_cubit.dart';
import 'SearchHomeScreen.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is MainProductsSuccess) {
          return GestureDetector(
            onTap: () {
              showSearch(
                  context: context,
                  delegate: SearchHomeScreen(shoesProducts: state.products));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 270.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Looking for shoes",
                  style: Txtstyle.style12(context: context).copyWith(
                    color: AppColors.kDeepGreyColorA6A,
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
