// ignore_for_file: file_names

class ProductsModel {
  String? brand;
  String? name;
  String? imageUrl;
  String? description;
  num? price;

  ProductsModel({
    required this.brand,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // Convert a Product object into a map object
  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'description': description,
    };
  }

  // Extract a Product object from a map object
  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
      brand: map['brand'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
    );
  }
}
