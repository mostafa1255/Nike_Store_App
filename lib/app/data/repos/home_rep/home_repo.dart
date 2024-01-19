import 'package:dartz/dartz.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import '../../../core/errors/faliure.dart';
import '../../models/vendors_Model.dart';

abstract class HomeRepo {
  Future<Either<Faliures, VendorModel>> getVendorsDataAndProducts();
  Future<Either<Faliures, void>> setVendorsDataAndProducts();

  Future<Either<Faliures, void>> addToFavouritesProducts({
    required String brand,
    required String name,
    required num price,
    required String imageUrl,
    required String description,
  });

  Future<Either<Faliures, List<ProductsModel>>> getFavouritesProducts();
}
