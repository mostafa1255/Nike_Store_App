import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.homeRepo}) : super(CartInitial());
  HomeRepo homeRepo;

  Future<void> addToCartProducts({required ProductsModel productsModel}) async {
    emit(AddtoCartProductsLoading());
    final result = await homeRepo.addProductToCollection(
        collectionName: "cart", productsModel: productsModel);
    result.fold(
      (l) => emit(AddtoCartProductsFailure(errMessage: l.errmessage)),
      (r) => emit(AddtoCartProductsSuccsess()),
    );
  }

  Future<void> getCartProducts() async {
    final result =
        await homeRepo.getProductsFromCollection(collectionName: "cart");
    result.fold(
      (l) => print("object"),
      (r) => print("object"),
    );
  }
}
