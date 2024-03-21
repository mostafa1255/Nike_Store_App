import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/Products_Model.dart';
import '../../../repos/home_rep/home_repo.dart';
part 'out_door_state.dart';

class OutDoorCubit extends Cubit<OutDoorState> {
  OutDoorCubit({required this.homeRepo}) : super(OutDoorInitial());
  HomeRepo homeRepo;

  Future<void> outDoorProducts() async {
    print("outdoor");
    emit(OutDoorProductsLoading());
    final result = await homeRepo.getAllProducts();
    result.fold((l) => emit(OutDoorProductsFailure(errMessage: l.errmessage)),
        (products) {
      List<ProductsModel> randomProducts = [];
      Random random = Random();
      for (int i = 0; i < 3; i++) {
        int randomIndex = random.nextInt(products.length);
        randomProducts.add(products[randomIndex]);
      }
      emit(OutDoorProductsSuccess(products: randomProducts));
    });
  }
}
