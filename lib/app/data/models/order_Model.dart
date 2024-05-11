import 'package:nike_store_app/app/data/models/User_Model.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';

class OrderModel {
  UserModel? user;
  String? orderId;
  List<CartModel>? cartModel;
  String? orderStatus;
  String? date;
  String? paymentMethod;
  String? total;
  String? longitude;
  String? latitude;
  OrderModel({
    required this.total,
    required this.longitude,
    required this.latitude,
    required this.cartModel,
    required this.paymentMethod,
    required this.orderStatus,
    required this.orderId,
    required this.user,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'longitude': longitude,
      'latitude': latitude,
      'user': user?.toJcon(),
      'orderId': orderId,
      'paymentMethod': paymentMethod,
      'cartModel': cartModel
          ?.map((cart) => cart.toJson())
          .toList(), // Convert list of CartModel to JSON
      'orderStatus': orderStatus,
      'date': date,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> map) {
    return OrderModel(
      total: map['total'] ?? '',
      longitude: map['longitude'] ?? '',
      latitude: map['latitude'] ?? '',
      user: UserModel.fromJcon(data: map['user']),
      paymentMethod: map['paymentMethod'] ?? '',
      orderId: map['orderId'] ?? '',
      cartModel: List<CartModel>.from((map['cartModel'] as List).map(
          (cartJson) => CartModel.fromJson(
              cartJson))), // Convert list of JSON to list of CartModel
      orderStatus: map['orderStatus'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
