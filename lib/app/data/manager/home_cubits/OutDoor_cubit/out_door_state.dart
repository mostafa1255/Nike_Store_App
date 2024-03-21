part of 'out_door_cubit.dart';

@immutable
sealed class OutDoorState {}

final class OutDoorInitial extends OutDoorState {}

final class OutDoorProductsLoading extends OutDoorState {}

final class OutDoorProductsSuccess extends OutDoorState {
  final List<ProductsModel> products;

  OutDoorProductsSuccess({required this.products});
}

final class OutDoorProductsFailure extends OutDoorState {
  final String errMessage;

  OutDoorProductsFailure({required this.errMessage});
}
