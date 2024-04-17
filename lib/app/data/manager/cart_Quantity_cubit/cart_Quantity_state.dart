part of 'cart_Quantity_cubit.dart';

@immutable
sealed class CartQuantityState {}

final class CartQuantityInitial extends CartQuantityState {}

final class CartQuantityUpdated extends CartQuantityState {
  final int quantity;

  CartQuantityUpdated({required this.quantity});
}

final class UpdateQuantityFailure extends CartQuantityState {
  final String errMessage;

  UpdateQuantityFailure({required this.errMessage});
}
