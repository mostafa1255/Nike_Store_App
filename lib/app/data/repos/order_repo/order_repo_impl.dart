import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'package:nike_store_app/app/core/utils/enums.dart';
import 'package:nike_store_app/app/data/models/order_Model.dart';
import 'package:nike_store_app/app/data/repos/order_repo/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, Appstate>> addProductsToOrder(
      {required OrderModel orderModel}) async {
    try {
      final productDoc = dataBase
          .collection("orders")
          .doc(auth.currentUser!.uid)
          .collection("products")
          .doc(orderModel.orderId);
      await productDoc.set(orderModel.toJson());
      return right(Appstate.productsUploaded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.code));
    }
  }

  @override
  Future<Either<Faliures, List<OrderModel>>> getProductsFromOrder() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await dataBase
          .collection("orders")
          .doc(auth.currentUser!.uid)
          .collection("products")
          .get();
      if (snapshot.docs.isNotEmpty) {
        List<OrderModel> productsList = [];
        for (var doc in snapshot.docs) {
          productsList.add(OrderModel.fromJson(doc.data()));
        }
        return right(productsList);
      } else {
        return left(FirebaseFailure("You Have't Order Yet"));
      }
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> deleteOrder({required String orderId}) async {
    try {
      await dataBase
          .collection("orders")
          .doc(auth.currentUser!.uid)
          .collection("products")
          .doc(orderId)
          .delete();
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> updateOrderStatus(
      {required String orderId, required String status}) async {
    try {
      await dataBase
          .collection("orders")
          .doc(auth.currentUser!.uid)
          .collection("products")
          .doc(orderId)
          .update({"status": status});
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }
}
