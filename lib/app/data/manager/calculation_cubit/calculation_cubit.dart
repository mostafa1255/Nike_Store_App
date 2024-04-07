import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(CalculationInitial());
  int quantity = 1;


  void incrementQuantity() {
    quantity++;
    emitQuantity();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emitQuantity();
    }
  }

  void emitQuantity() {
    emit(CartQuantityUpdated(quantity: quantity));
  }
}
