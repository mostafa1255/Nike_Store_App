part of 'new_arrivals_cubit.dart';

@immutable
sealed class NewArrivalsState {}

final class NewArrivalsInitial extends NewArrivalsState {}

final class NewArrivalsProductsLoading extends NewArrivalsState {}

final class NewArrivalsProductsSuccess extends NewArrivalsState {
  final List<ProductsModel> products;
  NewArrivalsProductsSuccess({required this.products});
}

final class NewArrivalsProductsFailure extends NewArrivalsState {
  final String errMessage;
  NewArrivalsProductsFailure({required this.errMessage});
}
