part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class MainProductsLoading extends HomeState {}

final class MainProductsSuccess extends HomeState {
  final List<ProductsModel> products;

  MainProductsSuccess({required this.products});
}

final class MainProductsFailure extends HomeState {
  final String errMessage;

  MainProductsFailure({required this.errMessage});
}

final class CartProductsLoading extends HomeState {}

final class CartProductsSuccess extends HomeState {
  final List<ProductsModel> products;

  CartProductsSuccess({required this.products});
}

final class CartProductsFailure extends HomeState {
  final String errMessage;

  CartProductsFailure({required this.errMessage});
}

