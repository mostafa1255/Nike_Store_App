import 'package:dartz/dartz.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/utils/enums.dart';
import 'package:nike_store_app/app/data/models/order_Model.dart';

abstract class OrderRepo {
  Future<Either<Faliures, Appstate>> addProductsToOrder({
    required OrderModel orderModel,
  });

  Future<Either<Faliures, List<OrderModel>>> getProductsFromOrder();
  Future<Either<Faliures, void>> deleteOrder({required String orderId});
  Future<Either<Faliures, void>> updateOrderStatus(
      {required String orderId, required String status});
}
