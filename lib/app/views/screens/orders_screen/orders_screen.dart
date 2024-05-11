import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/order_cubit/order_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/CustomBackIcon.dart';
import 'package:nike_store_app/app/views/screens/orders_screen/widgets/OrderScreenBody.dart';
import '../../common_widgets/CustomCartIcon.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Orders", witerColor: true),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderGetAllProductsSuccsess) {
            return OrderScreenBody(
              products: state.products,
            );
          } else if (state is OrderGetAllProductsFailure) {
            return Center(
              child: Text(state.errMessage,
                  style: Txtstyle.style20(context: context).copyWith()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    required bool witerColor}) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: witerColor ? Colors.white : AppColors.kOfWhiteColor,
      leading: CustomBackAndFavIcon(
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: Txtstyle.style16(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: [
        CustomCartIcon(
          onPressed: () {
            GoRouter.of(context).push(Approuter.mycartscreen);
          },
        ),
        HsizedBox(width: 15.w)
      ]);
}
