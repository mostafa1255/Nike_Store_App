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
