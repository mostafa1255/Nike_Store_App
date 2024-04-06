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



