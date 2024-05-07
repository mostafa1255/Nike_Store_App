import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/Products_Model.dart';

void saveProductsToHive(
    {required List<ProductsModel> products, required String boxName}) async {
  await Hive.box<ProductsModel>(boxName).addAll(products);
}
