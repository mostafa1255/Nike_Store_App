import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/Products_Model.dart';
import '../../../repos/home_rep/home_repo.dart';
part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit({required this.homeRepo}) : super(FilterInitial());
  HomeRepo homeRepo;
  Future<void> getFilterProducts({required String price}) async {
    emit(FilterLoading());
    final result = await homeRepo.getAllProducts();
    result.fold(
      (l) {
        return emit(FilterFailure(errMessage: l.errmessage));
      },
      (products) {
        List<ProductsModel> filterdList = [];
        for (int i = 0; i < products.length; i++) {
          if (num.parse(products[i].price!) <= num.parse(price)) {
            filterdList.add(products[i]);
          }
        }
        emit(FilterSuccess(products: filterdList, maxPrice: price));
      },
    );
  }

  void deactiveFilterIcon() {
    emit(DeactiveFilterIcon());
  }
}
