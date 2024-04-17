part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class RelevantProductsLoading extends DetailsState {}

final class RelevantProductsSuccsess extends DetailsState {
  final List<ProductsModel> productsList;

  RelevantProductsSuccsess({required this.productsList});
}

final class RelevantProductsFailure extends DetailsState {
  final String errMessage;
  RelevantProductsFailure({required this.errMessage});
}
