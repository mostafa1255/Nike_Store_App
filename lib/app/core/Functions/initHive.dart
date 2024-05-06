import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';

void initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsModelAdapter());
  await Hive.openBox(GloblaVariable.kAllProducts);
  await Hive.openBox(GloblaVariable.kOutDoorProducts);
  await Hive.openBox(GloblaVariable.kTennisProducts);
}