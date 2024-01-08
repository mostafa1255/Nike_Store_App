import 'Products_Model.dart';

class Vendor {
  String? id;
  String? name;
  String? email;
  String? location;
  num? number;
  Products? products;

  Vendor({
    required this.id,
    required this.email,
    required this.location,
    required this.name,
    required this.number,
    required this.products,
  });

  // Convert a Vendor object into a map object
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'number': number,
      'products': products?.toJson(),
    };
  }

  // Extract a Vendor object from a map object
  factory Vendor.fromMap(Map<String, dynamic> map, String documentId) {
    return Vendor(
      id: documentId,
      email: map['email'] ?? '',
      location: map['location'] ?? '',
      name: map['name'] ?? '',
      number: map['number']?.toInt() ?? 0,
      products: Products.fromJson(map['product']),
    );
  }
}
