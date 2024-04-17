import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import '../../../core/errors/firebase_faliure.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, void>> addProductWithQuantityToCart(
      {required ProductsModel productsModel}) async {
    try {
      final productDoc = dataBase
          .collection("cart")
          .doc(auth.currentUser!.uid)
          .collection("quantity")
          .doc(productsModel.id);
      CartModel cartModel =
          CartModel(productsModel: productsModel, quantity: 1);
      print("cartModel: ${cartModel.quantity} ${cartModel.productsModel.id}");
      await productDoc.set(cartModel.toJson());
      return right(null);
    } catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, List<CartModel>>> getAllProductswithQuantity() async {
    try {
      final productDoc = await dataBase
          .collection("cart")
          .doc(auth.currentUser!.uid)
          .collection("quantity")
          .get();
      if (productDoc.docs.isNotEmpty) {
        List<CartModel> productsList = [];
        for (var element in productDoc.docs) {
          productsList.add(CartModel.fromJson(element.data()));
        }
        return right(productsList);
      } else {
        return left(FirebaseFailure("There are no products in Cart"));
      }
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> updateQuantityofProduct(
      {required String id, required int quantity}) async {
    try {
      final productDoc = await dataBase
          .collection("cart")
          .doc(auth.currentUser!.uid)
          .collection("quantity")
          .doc(id)
          .update({'quantity': quantity});
      return right(null);
    } catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
    }
  }
}
