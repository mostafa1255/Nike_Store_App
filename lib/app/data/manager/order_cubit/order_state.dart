part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderLoaded extends OrderState {}

final class OrderError extends OrderState {
  final String errMessage;
  OrderError({required this.errMessage});
}

final class OrderGetAllProductsSuccsess extends OrderState {
  final List<OrderModel> products;
  OrderGetAllProductsSuccsess({required this.products});
}

final class OrderGetAllProductsFailure extends OrderState {
  final String errMessage;
  OrderGetAllProductsFailure({required this.errMessage});
}

final class OrderDeleted extends OrderState {}

final class OrderUpdated extends OrderState {}
