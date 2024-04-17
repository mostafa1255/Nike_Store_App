// ignore_for_file: file_names

class ProductsModel {
  String? id;
  String vendorId;
  String? brand;
  String? name;
  String? imageUrl;
  String? description;
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
