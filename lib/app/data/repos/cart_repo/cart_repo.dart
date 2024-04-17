import 'package:dartz/dartz.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';

abstract class CartRepo {
  Future<Either<Faliures, List<CartModel>>> getAllProductswithQuantity();

  Future<Either<Faliures, void>> addProductWithQuantityToCart({
    required ProductsModel productsModel,
  });
  Future<Either<Faliures, void>> updateQuantityofProduct({required String id,required int quantity});
}
