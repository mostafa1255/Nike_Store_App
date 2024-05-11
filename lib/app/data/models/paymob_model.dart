class PaymobModel {
  final String name;
  final String description;
  final String amountCents;
  final int quantity;

  PaymobModel({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
  });

  factory PaymobModel.fromJson(Map<String, dynamic> json) {
    return PaymobModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      amountCents: json['amount_cents'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'amount_cents': amountCents,
      'quantity': quantity,
    };
  }
}
