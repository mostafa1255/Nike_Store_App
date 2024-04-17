import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/Products_Model.dart';
import '../../repos/home_rep/home_repo.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.homeRepo}) : super(FavoriteInitial());
  HomeRepo homeRepo;

  Future<void> deleteFavoriteItem({required String productId}) async {
    final result = await homeRepo.deleteProductFromCollection(
      collectionName: "favorites",
      productId: productId,
      subCollectionName: "products",
    );
    getFavoriteProducts();
    result.fold(
      (l) {},
      (r) {},
    );
  }

  Future<void> addToFavoritesProducts(
      {required ProductsModel productsModel}) async {
    final result = await homeRepo.addProductToCollection(
        collectionName: "favorites", productsModel: productsModel);
    result.fold(
      (l) => emit(AddtoFavoriteFailure(errMessage: l.errmessage)),
      (r) {},
    );
  }

  Future<void> getFavoriteProducts() async {
    final result =
        await homeRepo.getProductsFromCollection(collectionName: "favorites");
    result.fold(
      (l) {
        print("Favorite Products: $l");
        emit(FavoriteLoadedFailure(errMessage: l.errmessage));
      },
      (r) {
        print(" Favorite Products: $r");
        emit(FavoriteLoadedSuccess(favProductsList: r));
      },
    );
  }
}
