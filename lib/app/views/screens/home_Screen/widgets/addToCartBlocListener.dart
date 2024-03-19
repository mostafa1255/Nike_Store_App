import '../../../../data/manager/cart_Cubit/cart_cubit.dart';
import '../../../common_widgets/ToastMessage.dart';

void addToCartBlocListener(context, state) {
  if (state is AddtoCartProductsSuccsess) {
    const ToastMessage(message: "Item Added To Cart").showToast(context);
  } else if (state is AddtoCartProductsFailure) {
    const ToastMessage(message: "Item Added To Cart").showToast(context);
  }
}