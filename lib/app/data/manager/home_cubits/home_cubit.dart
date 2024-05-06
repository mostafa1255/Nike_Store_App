import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/core/Functions/save_products_to_hive.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';
import '../../models/Products_Model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  HomeRepo homeRepo;
  Future<void> getAllProducts() async {
    emit(MainProductsLoading());
    Future.delayed(const Duration(seconds: 5), () async {
      final result = await homeRepo.getAllProducts();
      result.fold((l) => emit(MainProductsFailure(errMessage: l.errmessage)),
          (r) {
        saveProductsToHive(products: r, boxName: GloblaVariable.kAllProducts);
        emit(MainProductsSuccess(products: r));
      });
    });
  }
}
