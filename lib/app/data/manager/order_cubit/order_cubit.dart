import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/models/User_Model.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import 'package:nike_store_app/app/data/models/order_Model.dart';
import 'package:nike_store_app/app/data/repos/order_repo/order_repo.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.orderRepo}) : super(OrderInitial());
  OrderRepo orderRepo;

  Future<void> deleteOrder({required String orderId}) async {
    emit(OrderLoading());
    var result = await orderRepo.deleteOrder(orderId: orderId);
    result.fold((l) => emit(OrderError(errMessage: l.errmessage)),
        (r) => emit(OrderDeleted()));
  }

  Future<void> updateOrderStatus(
      {required String orderId, required String status}) async {
    emit(OrderLoading());
    var result =
        await orderRepo.updateOrderStatus(orderId: orderId, status: status);
    result.fold((l) => emit(OrderError(errMessage: l.errmessage)),
        (r) => emit(OrderUpdated()));
  }

  Future<void> uploadAllOrdersProducts(
      {required List<CartModel> products,
      required String total,
      required String lat,
      required String long,
      required UserModel userModel,
      required String paymentMethod}) async {
    emit(OrderLoading());
    var result = await orderRepo.addProductsToOrder(
        orderModel: OrderModel(
            cartModel: products,
            orderStatus: "In Way",
            paymentMethod: paymentMethod,
            total: total,
            user: userModel,
            longitude: long,
            latitude: lat,
            date: DateTime.now().toString(),
            orderId: generateUniqueOrderId()));
    result.fold((l) => emit(OrderError(errMessage: l.errmessage)), (r) {
      emit(OrderLoaded());
    });
  }

  Future<void> getAllOrdersProducts() async {
    emit(OrderLoading());
    var result = await orderRepo.getProductsFromOrder();
    result.fold(
        (l) => emit(OrderGetAllProductsFailure(errMessage: l.errmessage)), (r) {
      emit(OrderGetAllProductsSuccsess(products: r));
    });
  }

  String generateUniqueOrderId() {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomString = _getRandomString(6);
    return '$timestamp$randomString';
  }

  String _getRandomString(int length) {
    const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return List.generate(
        length, (index) => charset[random.nextInt(charset.length)]).join();
  }
}
