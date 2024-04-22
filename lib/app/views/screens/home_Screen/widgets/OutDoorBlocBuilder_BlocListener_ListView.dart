import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import '../../../../data/manager/home_cubits/OutDoor_cubit/out_door_cubit.dart';
import '../../../common_widgets/VsizedBox.dart';
import 'CustomHeaderofHomeItemListView.dart';
import '_buildBlocContent.dart';
import 'addToCartBlocListener.dart';

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
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            addToCartBlocListener(context, state);
          },
          child: BlocBuilder<OutDoorCubit, OutDoorState>(
            builder: (context, state) {
              return buildBlocContent(state, context: context);
            },
          ),
        )
      ],
    );
  }
}



