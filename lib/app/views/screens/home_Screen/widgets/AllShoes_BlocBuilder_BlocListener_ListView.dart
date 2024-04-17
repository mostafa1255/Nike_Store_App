import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import '../../../../data/manager/home_cubits/home_cubit.dart';
import '../../../common_widgets/Lottie_Loading_Animation.dart';
import '../../../common_widgets/VsizedBox.dart';
import 'CustomHeaderofHomeItemListView.dart';
import 'CustomHomeCardListView.dart';
import 'addToCartBlocListener.dart';

class AllShoes_BlocBuilder_BlocListener_ListView extends StatelessWidget {
  const AllShoes_BlocBuilder_BlocListener_ListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHeaderofHomeItemListView(
          popularOrNewarrival: 'Popular Shoes',
        ),
        const VsizedBox(height: 15),
        BlocListener<CartCubit, CartState>(
          listener: addToCartBlocListener,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state) {
                case MainProductsSuccess():
                  return CustomHomeCardListView(
                    products: state.products,
                  );
                case MainProductsFailure():
                  return Center(
                    child: Text(
                      state.errMessage,
                      style: Txtstyle.style16(context: context).copyWith(
                          color: const Color.fromARGB(255, 58, 54, 54)),
                    ),
                  );
                default:
                  return const Center(
                    child: Lottie_Loading_Animation(),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
