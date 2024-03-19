import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubit/home_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/FavoriteIconAction.dart';
import 'package:nike_store_app/app/views/common_widgets/Lottie_Loading_Animation.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/widgets/AddToCartButton.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../common_widgets/VsizedBox.dart';
import 'addToCartBlocListener.dart';

class CustomHomeCardListView extends StatelessWidget {
  const CustomHomeCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: addToCartBlocListener,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state) {
            case MainProductsSuccess():
              return SizedBox(
                width: double.infinity,
                height: 265.h,
                child: ListView.builder(
                    itemCount: state.products.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 25.w),
                        child: SizedBox(
                          height: 265.h,
                          width: 180.w,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23.r),
                            ),
                            margin: EdgeInsets.zero,
                            elevation: 0.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FavoriteIconAction(
                                    favProduct: state.products[index],
                                  ),
                                  SizedBox(
                                      width: 160.w,
                                      height: 110.h,
                                      child: Image.network(
                                        state.products[index].imageUrl!,
                                        fit: BoxFit.cover,
                                      )),
                                  Text(
                                    "BEST SELLER",
                                    style: Txtstyle.style12(context: context)
                                        .copyWith(
                                            fontFamily: Constants.popinsFamily,
                                            color: AppColors.kPrimaryColor,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const VsizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      state.products[index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: Txtstyle.style16(context: context)
                                          .copyWith(
                                              fontFamily:
                                                  Constants.relwayFamily,
                                              color:
                                                  AppColors.kDeepGreyColorA6A,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const VsizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "\$${state.products[index].price}",
                                          overflow: TextOverflow.ellipsis,
                                          style: Txtstyle.style14(
                                                  context: context)
                                              .copyWith(
                                                  fontFamily:
                                                      Constants.popinsFamily,
                                                  color: AppColors.kFontColor,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      AddToCartButton(
                                        productsModel: state.products[index],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            case MainProductsFailure():
              return Center(
                child: Text(
                  state.errMessage,
                  style: Txtstyle.style16(context: context)
                      .copyWith(fontFamily: Constants.relwayFamily),
                ),
              );
            default:
              return const Center(
                child: Lottie_Loading_Animation(),
              );
          }
        },
      ),
    );
  }
}
