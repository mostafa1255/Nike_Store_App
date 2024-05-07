import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'package:nike_store_app/app/core/utils/enums.dart';
import 'package:nike_store_app/app/data/data_source/home_local_data_source/home_local_data_source.dart';
import 'package:nike_store_app/app/data/data_source/home_remote_data_source/home_remote_data_source.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/vendors_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  VendorModel? vendorModel;
  ProductsModel? productsModel;

  @override
  Future<Either<Faliures, List<ProductsModel>>> getProductsFromCollection(
      {required String collectionName}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await dataBase
          .collection(collectionName)
          .doc(auth.currentUser!.uid)
          .collection("products")
          .get();
      if (snapshot.docs.isNotEmpty) {
        List<ProductsModel> productsList = [];
        for (var doc in snapshot.docs) {
          productsList.add(ProductsModel.fromJson(map: doc.data()));
        }
        return right(productsList);
      } else {
        return left(
            FirebaseFailure("There are no products in $collectionName"));
      }
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, List<ProductsModel>>> getAllProducts() async {
    try {
      final productsListlocal = homeLocalDataSource.getAllProducts();
      if (productsListlocal.isNotEmpty) {
        print(
            "productsListlocal ===============================================");
        return right(productsListlocal);
      } else {
        final productsListremote = await homeRemoteDataSource.getAllProducts();
        return right(productsListremote);
      }
    } catch (e) {
      print("$e======================================");
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, void>> deleteProductFromCollection({
    required String collectionName,
    required String subCollectionName,
    required String productId,
  }) async {
    try {
      await dataBase
          .collection(collectionName)
          .doc(auth.currentUser!.uid)
          .collection(subCollectionName)
          .doc(productId)
          .delete();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseFailure("Failed to delete product"));
    }
  }

  @override
  Future<Either<Faliures, Appstate>> addProductToCollection({
    required String collectionName,
    required ProductsModel productsModel,
  }) async {
    try {
      final productDoc = dataBase
          .collection(collectionName)
          .doc(auth.currentUser!.uid)
          .collection("products")
          .doc(productsModel.id);
      await productDoc.set(productsModel.toJson());
      return right(Appstate.productsUploaded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.code));
    }
  }
}
