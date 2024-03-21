import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';
import '../../models/Products_Model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  HomeRepo homeRepo;
  Future<void> getAllProducts() async {
    emit(MainProductsLoading());
    final result = await homeRepo.getAllProducts();
    result.fold(
      (l) => emit(MainProductsFailure(errMessage: l.errmessage)),
      (r) => emit(MainProductsSuccess(products: r)),
    );
  }



  Future<void> getFavoriteProducts() async {
    emit(CartProductsLoading());
    final result =
        await homeRepo.getProductsFromCollection(collectionName: "favorites");
    result.fold(
      (l) => emit(CartProductsFailure(errMessage: l.errmessage)),
      (r) => emit(CartProductsSuccess(products: r)),
    );
  }

  /*Future<void> addToFavoritesProducts(
      {required ProductsModel productsModel}) async {
    emit(AddtoCartProductsLoading());
    final result = await homeRepo.addProductToCollection(
        collectionName: "favorites", productsModel: productsModel);
    result.fold(
      (l) => emit(AddtoCartProductsFailure(errMessage: l.errmessage)),
      (r) => emit(AddtoCartProductsSuccsess()),
    );
  }
  */
}
