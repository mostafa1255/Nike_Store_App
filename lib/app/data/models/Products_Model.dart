// ignore_for_file: file_names

class Products {
  String? brand;
  String? name;
  String? description;
  num? price;

  Products({
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
  });

  // Convert a Product object into a map object
  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'name': name,
      'price': price,
      'description': description,
    };
  }

  // Extract a Product object from a map object
  factory Products.fromJson(Map<String, dynamic> map) {
    return Products(
      brand: map['brand'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
    );
  }
}
