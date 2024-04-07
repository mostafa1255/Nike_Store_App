import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/data/manager/calculation_cubit/calculation_cubit.dart';
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
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: BlocBuilder<CalculationCubit,
                                    CalculationState>(
                                  builder: (context, state) {
                                    if (state is CartQuantityUpdated ||
                                        state is CalculationInitial) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                context
                                                    .read<CalculationCubit>()
                                                    .incrementQuantity();
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                size: 25.sp,
                                                color: Colors.white,
                                              )),
                                          Flexible(
                                            child: Text(
                                              context
                                                  .read<CalculationCubit>()
                                                  .quantity
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: Txtstyle.style14(
                                                      context: context)
                                                  .copyWith(
                                                fontFamily:
                                                    Constants.relwayFamily,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                context
                                                    .read<CalculationCubit>()
                                                    .decrementQuantity();
                                              },
                                              icon: Icon(
                                                FontAwesomeIcons.minus,
                                                color: Colors.white,
                                                size: 20.sp,
                                              ))
                                        ],
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
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
                                  cartCubit.deleteCartItem(
                                      productId: state.products[index].id!);
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
                                          color:
                                              Colors.black.withOpacity(0.035),
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                      child: Image.network(
                                        state.products[index].imageUrl!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const HsizedBox(width: 55),
                                    Column(
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
                                              state.products[index].name!,
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
                                        Flexible(
                                          child: Text(
                                            "\$${state.products[index].price}",
                                            style: Txtstyle.style14(
                                                    context: context)
                                                .copyWith(
                                                    color: AppColors.kFontColor,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily:
                                                        Constants.popinsFamily,
                                                    fontWeight:
                                                        FontWeight.w600),
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
