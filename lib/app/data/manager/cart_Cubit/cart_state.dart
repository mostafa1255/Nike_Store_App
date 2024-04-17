part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddtoCartProductsLoading extends CartState {}

final class AddtoCartProductsSuccsess extends CartState {}

final class AddtoCartProductsFailure extends CartState {
  final String errMessage;

  AddtoCartProductsFailure({required this.errMessage});
}

final class GetFromCartLoading extends CartState {}

final class GetFromCartSuccsesswithProducts extends CartState {
  final List<CartModel> products;
  final num totalPrice;
  GetFromCartSuccsesswithProducts(
      {required this.products, required this.totalPrice});
}

final class GetFromCartFailure extends CartState {
  final String errMessage;

  GetFromCartFailure({required this.errMessage});
}

final class GetFromCartSuccsesswithOutProducts extends CartState {}

//final class DeleteCartItemSuccsess extends CartState {}

final class DeleteCartItemFailure extends CartState {
  final String errMessage;

  DeleteCartItemFailure({required this.errMessage});
}

final class CartQuantityUpdatedSuccess extends CartState {
  final int quantity;

  CartQuantityUpdatedSuccess({required this.quantity});
}

final class CartQuantityUpdatedFaliure extends CartState {
  final String errMessage;

  CartQuantityUpdatedFaliure({required this.errMessage});
}
