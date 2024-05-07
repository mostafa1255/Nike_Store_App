
import 'package:nike_store_app/app/data/models/Products_Model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductsModel>> getAllProducts();
}
