import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/Products_Model.dart';
import '../../repos/home_rep/home_repo.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.homeRepo}) : super(FavoriteInitial());
  HomeRepo homeRepo;
  List<ProductsModel> favProducts = [];

  void toggleFavorite(ProductsModel product) {
    if (favProducts.contains(product)) {
      favProducts.remove(product);
    } else {
      favProducts.add(product);
    }
    print("Favorite Products: $favProducts");
    emit(FavoriteUpdated(favProducts));
  }

  Future<void> addToFavoritesProducts(
      {required ProductsModel productsModel}) async {
    emit(AddtoFavoriteLoading());
    final result = await homeRepo.addProductToCollection(
        collectionName: "favorites", productsModel: productsModel);
    print(" Favorite Products: $favProducts");
    result.fold(
      (l) => emit(AddtoFavoriteFailure(errMessage: l.errmessage)),
      (r) => emit(AddtoFavoriteSuccsess()),
    );
  }

  Future<void> getFavoriteProducts() async {
    final result =
        await homeRepo.getProductsFromCollection(collectionName: "favorite");
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
