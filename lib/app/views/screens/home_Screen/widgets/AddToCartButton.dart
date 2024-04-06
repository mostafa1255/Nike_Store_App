import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import '../../../../data/manager/cart_Cubit/cart_cubit.dart';
import '../../../../data/models/Products_Model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    var cCubit = BlocProvider.of<CartCubit>(context);
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  15.r,
                ),
                topLeft: Radius.circular(17.r)),
            color: AppColors.kPrimaryColor),
        child: IconButton(
            onPressed: () async {
             // print("Add To Cart");
              await cCubit.addToCartProducts(productsModel: productsModel);
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 21.sp,
            )),
      ),
    );
  }
}
