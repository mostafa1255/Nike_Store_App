import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/core/Functions/save_products_to_hive.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import '../../../models/Products_Model.dart';
import '../../../repos/home_rep/home_repo.dart';
part 'tennis_state.dart';

class TennisCubit extends Cubit<TennisState> {
  TennisCubit({required this.homeRepo}) : super(TennisInitial());
  HomeRepo homeRepo;
  Future<void> fetchTennisProducts() async {
    emit(FetchTennisProductsLoading());
    final result = await homeRepo.getAllProducts();
    result
        .fold((l) => emit(FetchTennisProductsFailure(errMessage: l.errmessage)),
            (products) {
      List<ProductsModel> tennisProducts = [];
      for (int i = 0; i < products.length; i++) {
        if (int.parse(products[i].price!) >= 800) {
          tennisProducts.add(products[i]);
        }
      }
      saveProductsToHive(products: tennisProducts, boxName: GloblaVariable.kTennisProducts);
      emit(FetchTennisProductsSuccess(products: tennisProducts));
    });
  }
}
