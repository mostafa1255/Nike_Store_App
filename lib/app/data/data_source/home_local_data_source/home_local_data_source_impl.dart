import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/data_source/home_local_data_source/home_local_data_source.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<ProductsModel> getAllProducts() {
    var box = Hive.box<ProductsModel>(GloblaVariable.kAllProducts);
    return box.values.toList();
  }
}
