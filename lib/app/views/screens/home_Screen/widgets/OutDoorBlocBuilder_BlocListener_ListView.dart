import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import '../../../../data/manager/home_cubits/OutDoor_cubit/out_door_cubit.dart';
import '../../../../router/app_router.dart';
import '../../../common_widgets/Lottie_Loading_Animation.dart';
import '../../../common_widgets/VsizedBox.dart';
import 'CustomHeaderofHomeItemListView.dart';
import 'CustomHomeCardListView.dart';

class OutDoorBlocBuilderBlocListenerListView extends StatelessWidget {
  const OutDoorBlocBuilderBlocListenerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHeaderofHomeItemListView(
            popularOrNewarrival: "Outdoor Shoes"),
        const VsizedBox(height: 15),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Approuter.detailsscreen);
          },
          child: BlocBuilder<OutDoorCubit, OutDoorState>(
            builder: (context, state) {
              switch (state) {
                case OutDoorProductsSuccess():
                  return CustomHomeCardListView(
                    products: state.products,
                  );
                case OutDoorProductsFailure():
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
        )
      ],
    );
  }
}
