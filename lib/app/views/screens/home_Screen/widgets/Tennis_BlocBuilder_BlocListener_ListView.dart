import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/tennis_cubit/tennis_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/widgets/addToCartBlocListener.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../router/app_router.dart';
import '../../../common_widgets/Lottie_Loading_Animation.dart';
import 'CustomHeaderofHomeItemListView.dart';
import 'CustomHomeCardListView.dart';

class TennisBlocBuilderBlocListenerListView extends StatelessWidget {
  const TennisBlocBuilderBlocListenerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHeaderofHomeItemListView(
            popularOrNewarrival: "Tennis Shoes"),
        const VsizedBox(height: 15),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Approuter.detailsscreen);
          },
          child: BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              addToCartBlocListener(context, state);
            },
            child: BlocBuilder<TennisCubit, TennisState>(
              builder: (context, state) {
                switch (state) {
                  case FetchTennisProductsSuccess():
                    return CustomHomeCardListView(
                      products: state.products,
                    );
                  case FetchTennisProductsFailure():
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
        )
      ],
    );
  }
}
