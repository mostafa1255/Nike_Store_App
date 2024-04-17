import 'package:nike_store_app/app/data/models/Products_Model.dart';

class CartModel {
  ProductsModel productsModel;
  int quantity;

  CartModel({
    required this.productsModel,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'productsModel': productsModel.toJson(), // Convert ProductsModel to JSON
      'quantity': quantity,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> map) {
    return CartModel(
      productsModel: ProductsModel.fromJson(map: map['productsModel'],),
      quantity: map['quantity'] ?? 0,
    );
  }
}
