
class VendorModel {
  String? id;
  String? name;
  String? email;
  String? location;
  num? number;

  VendorModel({
    required this.id,
    required this.email,
    required this.location,
    required this.name,
    required this.number,
  });

  // Convert a Vendor object into a map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'location': location,
      'number': number,
    };
  }

  // Extract a Vendor object from a map object
  factory VendorModel.fromMap({required Map<String, dynamic> map}) {
    return VendorModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      location: map['location'] ?? '',
      name: map['name'] ?? '',
      number: map['number']?.toInt() ?? 0,
    );
  }
}
