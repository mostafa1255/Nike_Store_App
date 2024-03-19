import 'package:dartz/dartz.dart';
import 'package:nike_store_app/app/core/tools/enums.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/User_Model.dart';
import '../../../core/errors/faliure.dart';
import '../../models/vendors_Model.dart';

abstract class HomeRepo {
  Future<Either<Faliures, VendorModel>> getVendorsDataAndProducts();
  Future<Either<Faliures, Appstate>> setVendorsDataAndProducts();

  Future<Either<Faliures, List<ProductsModel>>> getProductsFromCollection(
      {required String collectionName});

  Future<Either<Faliures, List<ProductsModel>>> getAllProducts();
  //Future<Either<Faliures, List<ProductsModel>>> addTo();

  Future<Either<Faliures, Appstate>> addProductToCollection({
    required String collectionName,
    required ProductsModel productsModel,
  });
}
