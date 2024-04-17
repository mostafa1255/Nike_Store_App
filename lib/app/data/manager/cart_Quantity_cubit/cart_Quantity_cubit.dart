import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/repos/cart_repo/cart_repo.dart';
part 'cart_Quantity_state.dart';

class CartQuantityCubit extends Cubit<CartQuantityState> {
  CartQuantityCubit({required this.cartRepo}) : super(CartQuantityInitial());
  CartRepo cartRepo;
  Future<void> updateQuantityofProduct(
      {required String id, required int quantity}) async {
    if (quantity > 0) {
      final result =
        await cartRepo.updateQuantityofProduct(id: id, quantity: quantity);
    result.fold(
      (l) => emit(UpdateQuantityFailure(errMessage: l.errmessage)),
      (r) => emit(CartQuantityUpdated(quantity: quantity)),
    );
    }
  }
}
