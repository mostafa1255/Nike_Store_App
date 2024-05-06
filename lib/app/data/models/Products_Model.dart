import 'package:hive_flutter/adapters.dart';
part 'Products_Model.g.dart';

@HiveType(typeId: 0)
class ProductsModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? vendorId;
  @HiveField(2)
  String? brand;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? imageUrl;
  @HiveField(5)
  String? description;
  @HiveField(6)
  String? price;

  ProductsModel({
    required this.id,
    required this.vendorId,
    required this.brand,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // Convert a Product object into a map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendorId': vendorId,
      'brand': brand,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'description': description,
    };
  }

  // Extract a Product object from a map object
  factory ProductsModel.fromJson({required Map<String, dynamic> map}) {
    return ProductsModel(
      id: map['id'] ?? '',
      vendorId: map['vendorId'] ?? '',
      brand: map['brand'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? "0.0",
      description: map['description'] ?? '',
    );
  }
}
