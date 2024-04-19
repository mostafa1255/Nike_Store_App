import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/Products_Model.dart';
import '../../../repos/home_rep/home_repo.dart';
part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit({required this.homeRepo}) : super(NewArrivalsInitial());
  HomeRepo homeRepo;

  Future<void> newArrivalsProducts() async {
    emit(NewArrivalsProductsLoading());
    final result = await homeRepo.getAllProducts();
    result
        .fold((l) => emit(NewArrivalsProductsFailure(errMessage: l.errmessage)),
            (products) {
      List<ProductsModel> randomProducts = [];
      Random random = Random();
      for (int i = 0; i < 3; i++) {
        int randomIndex = random.nextInt(products.length);
        randomProducts.add(products[randomIndex]);
      }
      emit(NewArrivalsProductsSuccess(products: randomProducts));
    });
  }
}
