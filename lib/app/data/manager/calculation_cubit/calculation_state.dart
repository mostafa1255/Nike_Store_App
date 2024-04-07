part of 'calculation_cubit.dart';

@immutable
sealed class CalculationState {}

final class CalculationInitial extends CalculationState {}

final class CartQuantityUpdated extends CalculationState {
  final int quantity;
  
  CartQuantityUpdated({required this.quantity});
}
