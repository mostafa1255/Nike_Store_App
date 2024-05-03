import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/data/manager/fcm_cubit/fcm_cubit.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';

import '../../../../router/app_router.dart';
import '../../../common_widgets/Lottie_Loading_Animation.dart';

class RecentListViewInNotificationScreen extends StatelessWidget {
  const RecentListViewInNotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FcmCubit, FcmState>(builder: (context, state) {
      if (state is GetFcmProductSuccsess) {
        return ListView.builder(
            itemCount: state.productsList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (itemBuilder, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Approuter.detailsscreen,
                        extra: state.productsList[index].productsModel);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 110.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: CachedNetworkImageProvider(state
                                      .productsList[index]
                                      .productsModel
                                      .imageUrl!)),
                              color: Colors.grey.withOpacity(0.09),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 235.w,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    state.productsList[index].date,
                                    textAlign: TextAlign.center,
                                    style: Txtstyle.style14(context: context)
                                        .copyWith(
                                      color: AppColors.kGreyColorB81,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFonts.popinsFamily,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200.w,
                                child: AutoSizeText(
                                  state.productsList[index].productsModel.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Txtstyle.style18(context: context)
                                      .copyWith(
                                    color: AppColors.kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFonts.relwayFamily,
                                  ),
                                ),
                              ),
                              const VsizedBox(height: 5),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  " \$${state.productsList[index].productsModel.price}",
                                  style: Txtstyle.style16(context: context)
                                      .copyWith(
                                    color: AppColors.kFontColor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFonts.popinsFamily,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      } else if (state is GetFcmProductFailure) {
        return Center(
          heightFactor: 20.h,
          child: Text(state.errMessage,
              style: Txtstyle.style18(context: context)
                  .copyWith(color: AppColors.kGreyColorB81)),
        );
      } else {
        return const Lottie_Loading_Animation();
      }
    });
  }
}
