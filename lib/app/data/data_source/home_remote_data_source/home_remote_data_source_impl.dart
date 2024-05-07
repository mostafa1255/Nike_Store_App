import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_store_app/app/core/Functions/save_products_to_hive.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/data_source/home_remote_data_source/home_remote_data_source.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final dataBase = FirebaseFirestore.instance;

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    final product = await dataBase.collection("products").get();
    List<ProductsModel> productsList = [];
    for (var element in product.docs) {
      productsList.add(ProductsModel.fromJson(map: element.data()));
    }
    saveProductsToHive(
        products: productsList, boxName: GloblaVariable.kAllProducts);
    return productsList;
  }
}


