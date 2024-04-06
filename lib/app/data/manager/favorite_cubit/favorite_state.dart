part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final List<ProductsModel> favProducts;

  FavoriteUpdated(this.favProducts);
}

final class AddtoFavoriteLoading extends FavoriteState {}

final class AddtoFavoriteSuccsess extends FavoriteState {}

final class AddtoFavoriteFailure extends FavoriteState {
  final String errMessage;
  AddtoFavoriteFailure({required this.errMessage});
}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoadedSuccess extends FavoriteState {
  final List<ProductsModel> favProductsList;
  FavoriteLoadedSuccess({required this.favProductsList});
}

final class FavoriteLoadedFailure extends FavoriteState {
  final String errMessage;
  FavoriteLoadedFailure({required this.errMessage});
}
