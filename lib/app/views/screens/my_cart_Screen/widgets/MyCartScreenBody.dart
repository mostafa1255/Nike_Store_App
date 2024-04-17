import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/HsizedBox.dart';
import 'package:nike_store_app/app/views/common_widgets/Lottie_Loading_Animation.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';

class MyCartScreenBody extends StatefulWidget {
  const MyCartScreenBody({super.key});

  @override
  State<MyCartScreenBody> createState() => _MyCartScreenBodyState();
}

class _MyCartScreenBodyState extends State<MyCartScreenBody> {
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: BlocConsumer<CartCubit, CartState>(listener: (context, state) {
        // TODO: implement listener,
      }, builder: (context, state) {
        switch (state) {
          case GetFromCartLoading():
            return const Center(
              child: Lottie_Loading_Animation(),
            );
          case GetFromCartSuccsesswithProducts():
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${state.products.length} Item",
                  style: Txtstyle.style16(context: context).copyWith(
                      color: AppColors.kFontColor,
                      fontFamily: Constants.popinsFamily,
                      fontWeight: FontWeight.w600),
                ),
                const VsizedBox(height: 15),
                ListView.builder(
                    itemCount: state.products.length,
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
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              cartCubit
                                                  .updateQuantityofProduct(
                                                      id: state.products[index]
                                                          .productsModel.id!,
                                                      quantity: ++state
                                                          .products[index]
                                                          .quantity);
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 25.sp,
                                              color: Colors.white,
                                            )),
                                        //here take the quantity from cart model
                                        Flexible(
                                          child: Text(
                                            state.products[index].quantity
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: Txtstyle.style14(
                                                    context: context)
                                                .copyWith(
                                              fontFamily:
                                                  Constants.relwayFamily,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              if (state.products[index]
                                                      .quantity >
                                                  1) {
                                                cartCubit
                                                    .updateQuantityofProduct(
                                                        id: state
                                                            .products[index]
                                                            .productsModel
                                                            .id!,
                                                        quantity: --state
                                                            .products[index]
                                                            .quantity);
                                                setState(() {});
                                              }
                                            },
                                            icon: Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                              size: 20.sp,
                                            ))
                                      ],
                                    ))
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
                                    cartCubit.deleteCartItem(
                                        productId: state
                                            .products[index].productsModel.id!);
                                    cartCubit.getCartProducts();
                                    state.products.removeAt(index);
                                    setState(() {});
                                  },
                                  backgroundColor: AppColors.kredColor,
                                  foregroundColor: Colors.white,
                                  icon: FontAwesomeIcons.trashCan,
                                )
                              ],
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 145.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
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
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: state.products[index]
                                            .productsModel.imageUrl!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const HsizedBox(width: 55),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const VsizedBox(height: 0),
                                          Flexible(
                                            child: SizedBox(
                                              width: 130.w,
                                              child: Text(
                                                state.products[index]
                                                    .productsModel.name!,
                                                style: Txtstyle.style16(
                                                        context: context)
                                                    .copyWith(
                                                  color: AppColors.kFontColor,
                                                  fontFamily:
                                                      Constants.relwayFamily,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Price :  ",
                                                style: Txtstyle.style16(
                                                        context: context)
                                                    .copyWith(
                                                  color: AppColors.kFontColor,
                                                  fontFamily:
                                                      Constants.relwayFamily,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Expanded(
                                                child: AutoSizeText(
                                                  "\$${(state.products[index].productsModel.price! * state.products[index].quantity).toString()}",
                                                  maxLines: 3,
                                                  style: Txtstyle.style14(
                                                          context: context)
                                                      .copyWith(
                                                    color: AppColors.kFontColor,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily:
                                                        Constants.popinsFamily,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const VsizedBox(height: 0),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    })
              ],
            );
          case GetFromCartFailure():
            return Center(
              heightFactor: 20.h,
              child: Text(state.errMessage,
                  style: Txtstyle.style22(context: context).copyWith(
                      fontFamily: Constants.relwayFamily,
                      color: AppColors.kFontColor,
                      fontWeight: FontWeight.bold)),
            );
          case DeleteCartItemFailure():
            return Center(
              child: Text(state.errMessage,
                  style: Txtstyle.style22(context: context).copyWith(
                      fontFamily: Constants.relwayFamily,
                      fontWeight: FontWeight.w600)),
            );
          default:
            return const SizedBox.shrink();
        }
      })),
    ));
  }
}
