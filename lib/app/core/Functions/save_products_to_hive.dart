import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/Products_Model.dart';

void saveProductsToHive(
    {required List<ProductsModel> products, required String boxName}) async {
  await Hive.openBox<ProductsModel>(boxName);
//  await Hive.box<ProductsModel>('products').clear();
  await Hive.box<ProductsModel>('products').addAll(products);
}
