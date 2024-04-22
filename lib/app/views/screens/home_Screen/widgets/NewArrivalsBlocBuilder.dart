import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../data/manager/home_cubits/new_arrivals/new_arrivals_cubit.dart';
import 'NewArrivalsAndOffersHomeListView.dart';
import '_buildShimmerListView.dart';

class NewArrivalsBlocBuilder extends StatelessWidget {
  const NewArrivalsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
      builder: (context, state) {
        switch (state) {
          case NewArrivalsProductsSuccess():
            return NewArrivalsAndOffersHomeListView(
              products: state.products,
            );
          case NewArrivalsProductsFailure():
            return Column(
              children: [
                const Icon(Icons.image_not_supported_rounded),
                Text(state.errMessage,
                    style: Txtstyle.style16(context: context)
                        .copyWith(color: AppColors.kDeepGreyColorA6A))
              ],
            );
          default:
            return buildShimmerListView();
        }
      },
    );
  }
}

