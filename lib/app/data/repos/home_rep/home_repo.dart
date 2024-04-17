import 'package:dartz/dartz.dart';
import 'package:nike_store_app/app/core/tools/enums.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import '../../../core/errors/faliure.dart';

abstract class HomeRepo {
  Future<Either<Faliures, List<ProductsModel>>> getProductsFromCollection(
      {required String collectionName});

  Future<Either<Faliures, List<ProductsModel>>> getAllProducts();

  Future<Either<Faliures, Appstate>> addProductToCollection({
    required String collectionName,
    required ProductsModel productsModel,
  });
  Future<Either<Faliures, void>> deleteProductFromCollection({
    required String collectionName,
    required String subCollectionName,
    required String productId,
  });
}
