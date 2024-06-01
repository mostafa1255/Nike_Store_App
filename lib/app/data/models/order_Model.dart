import 'package:nike_store_app/app/data/models/User_Model.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';

class OrderModel {
  String? userName;
  String? userPhoneNumber;
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
    required this.date,
    required this.userName,
    required this.userPhoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'longitude': longitude,
      'latitude': latitude,
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
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
      userName: map['userName'] ?? '',
      userPhoneNumber: map['userPhoneNumber'] ?? '',
      total: map['total'] ?? '',
      longitude: map['longitude'] ?? '',
      latitude: map['latitude'] ?? '',
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
