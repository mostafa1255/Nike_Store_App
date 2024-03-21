part of 'tennis_cubit.dart';

@immutable
sealed class TennisState {}

final class TennisInitial extends TennisState {}

final class FetchTennisProductsLoading extends TennisState {}

final class FetchTennisProductsSuccess extends TennisState {
  final List<ProductsModel> products;
  FetchTennisProductsSuccess({required this.products});
}

final class FetchTennisProductsFailure extends TennisState {
  final String errMessage;
  FetchTennisProductsFailure({required this.errMessage});
}
