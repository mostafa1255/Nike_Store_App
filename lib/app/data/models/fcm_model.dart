
import 'Products_Model.dart';

class FcmModel {
  ProductsModel productsModel;
  String date;
  FcmModel({required this.productsModel, required this.date});
  Map<String, dynamic> toJson() {
    return {
      'productsModel': productsModel.toJson(), // Convert ProductsModel to JSON
      'date': date,
    };
  }

  factory FcmModel.fromJson(Map<String, dynamic> map) {
    return FcmModel(
      productsModel: ProductsModel.fromJson(
        map: map['productsModel'],
      ),
      date: map['date'] ?? "00-00",
    );
  }
}
