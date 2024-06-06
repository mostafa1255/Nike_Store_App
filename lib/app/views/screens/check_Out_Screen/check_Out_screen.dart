import 'package:dio/dio.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/order_cubit/order_cubit.dart';
import 'package:nike_store_app/app/data/manager/paymob_cubit/paymob_cubit.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo_impl.dart';
import '../../../core/Functions/setUp_Service_Locator.dart';
import '../../../data/repos/order_repo/order_repo_impl.dart';
import '../my_cart_Screen/widgets/BottomNavBarOfMyCheckOutScreen.dart';
import 'widgets/CheckOutAlertDialog.dart';
import 'widgets/CheckOutScreenBody.dart';
import 'widgets/checkOutAppBar.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({
    super.key,
    required this.subTotalPrice,
    required this.cartModel,
  });
  final num subTotalPrice;
  final List<CartModel> cartModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymobCubit(apiServices: ApiServices(dio: Dio())),
      child: Scaffold(
        bottomNavigationBar: BlocProvider(
          create: (context) => OrderCubit(
              homeRepo: getIt.get<HomeRepoImpl>(), orderRepo: OrderRepoImpl()),
          child: BottomNavBarOfMyCheckOutScreen(
            cartModel: cartModel,
            subTotalPrice: subTotalPrice,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CheckOutAlertDialog(
                    onPressed: () {
                      GoRouter.of(context).push(Approuter.homescreen);
                    },
                  );
                },
              );
            },
          ),
        ),
        backgroundColor: AppColors.kOfWhiteColor,
        appBar: checkOutAppBar(context),
        body: const CheckOutScreenBody(),
      ),
    );
  }
}
