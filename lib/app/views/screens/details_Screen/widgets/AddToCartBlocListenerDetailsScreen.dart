import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../data/models/Products_Model.dart';
import '../../../common_widgets/HsizedBox.dart';
import '../../../common_widgets/customMainButton.dart';
import '../../home_Screen/widgets/addToCartBlocListener.dart';

class AddToCartBlocListenerDetailsScreen extends StatelessWidget {
  const AddToCartBlocListenerDetailsScreen({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: addToCartBlocListener,
      child: CustomMainButton(
        onPressed: () {
          BlocProvider.of<CartCubit>(context)
              .addToCartProducts(productsModel: productsModel);
        },
        width: 210.w,
        color: AppColors.kPrimaryColor,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HsizedBox(width: 5),
            SizedBox(
              width: 20.w,
              height: 30.h,
              child: Image.asset(
                AppImages.iconcart,
                color: Colors.white,
              ),
            ),
            const HsizedBox(width: 10),
            Text(
              "Add to Cart",
              style: Txtstyle.style14(context: context).copyWith(
                color: Colors.white,
                fontFamily: Constants.relwayFamily,
              ),
            ),
            const HsizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
