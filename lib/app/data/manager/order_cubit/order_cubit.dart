import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import 'package:nike_store_app/app/data/models/order_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';
import 'package:nike_store_app/app/data/repos/order_repo/order_repo.dart';
import '../../../core/Functions/generate_Random_UniqueId.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.orderRepo, required this.homeRepo})
      : super(OrderInitial());
  OrderRepo orderRepo;
  HomeRepo homeRepo;
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
      required String userName,
      required String userPhone,
      required String paymentMethod}) async {
    emit(OrderLoading());
    var result = await orderRepo.addProductsToOrder(
        orderModel: OrderModel(
            cartModel: products,
            orderStatus: GloblaVariable.kInWay,
            paymentMethod: paymentMethod,
            total: total,
            userName: userName,
            userPhoneNumber: userPhone,
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
      (l) => emit(OrderGetAllProductsFailure(errMessage: l.errmessage)),
      (r) {
        r.sort((a, b) {
          if (a.orderStatus == GloblaVariable.kInWay &&
              b.orderStatus != GloblaVariable.kInWay) {
            return -1;
          } else if (a.orderStatus != GloblaVariable.kInWay &&
              b.orderStatus == GloblaVariable.kInWay) {
            return 1;
          } else {
            return 0;
          }
        });
        emit(OrderGetAllProductsSuccsess(products: r));
      },
    );
  }

  Future<void> deleteCartItem({required List<CartModel> products}) async {
    for (var element in products) {
      await homeRepo.deleteProductFromCollection(
        collectionName: "cart",
        productId: element.productsModel.id!,
        subCollectionName: "quantity",
      );
    }
  }
}
