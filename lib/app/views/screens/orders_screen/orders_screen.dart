import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/data/manager/order_cubit/order_cubit.dart';
import 'package:nike_store_app/app/views/screens/orders_screen/widgets/OrderScreenBody.dart';
import '../../../core/Functions/setUp_Service_Locator.dart';
import '../../../core/styles/text_Style.dart';
import '../../../data/repos/home_rep/home_repo_impl.dart';
import '../../../data/repos/order_repo/order_repo_impl.dart';
import 'widgets/customAppBar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>(
      create: (context) => OrderCubit(
          orderRepo: OrderRepoImpl(), homeRepo: getIt.get<HomeRepoImpl>())
        ..getAllOrdersProducts(),
      child: Scaffold(
        appBar:
            customAppBar(context: context, title: "Orders", witerColor: true),
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
      ),
    );
  }
}
