import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({required this.homeRepo}) : super(DetailsInitial());
  HomeRepo homeRepo;

  Future<void> getRelevantProduct({required String vendorId}) async {
    emit(RelevantProductsLoading());
    final result = await homeRepo.getAllProducts();
    List<ProductsModel> productsList = [];
    result.fold((l) => emit(RelevantProductsFailure(errMessage: l.errmessage)),
        (r) {
      for (var element in r) {
        if (element.vendorId == vendorId) {
          productsList.add(element);
        }
      }
      emit(RelevantProductsSuccsess(productsList: productsList));
    });
  }
}
