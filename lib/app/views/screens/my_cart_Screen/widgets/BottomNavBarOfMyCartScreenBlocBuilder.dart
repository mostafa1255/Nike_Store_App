import '../../../../core/Functions/calculateSubTotalPrice.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/cart_Cubit/cart_cubit.dart';
import 'BottomNavBarOfMyCartScreen.dart';

class BottomNavBarOfMyCartScreenBlocBuilder extends StatelessWidget {
  const BottomNavBarOfMyCartScreenBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetFromCartSuccsesswithProducts) {
          return BottomNavBarOfMyCartScreen(
            subTotalPrice: calculateSubTotalPrice(state.products),
            onPressed: () {
              GoRouter.of(context).push(Approuter.checkoutscreen, extra: {
                "total": calculateSubTotalPrice(state.products),
                "products": state.products
              });
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
