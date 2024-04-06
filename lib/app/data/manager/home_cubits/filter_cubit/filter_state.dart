part of 'filter_cubit.dart';

@immutable
sealed class FilterState {}

final class FilterInitial extends FilterState {}

final class FilterLoading extends FilterState {}

final class FilterSuccess extends FilterState {
  final List<ProductsModel> products;
  final String maxPrice;
  FilterSuccess({required this.products, required this.maxPrice});
}

final class FilterFailure extends FilterState {
  final String errMessage;
  FilterFailure({required this.errMessage});
}


final class DeactiveFilterIcon extends FilterState {}
