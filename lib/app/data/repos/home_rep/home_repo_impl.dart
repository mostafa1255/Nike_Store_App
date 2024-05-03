import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'package:nike_store_app/app/core/utils/enums.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/vendors_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  VendorModel? vendorModel;
  ProductsModel? productsModel;

  Future<List<String>> getAllUserUIDs() async {
    List<String> uids = [];
    try {
      QuerySnapshot querySnapshot = await dataBase.collection('users').get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        uids.add(doc.id);
      }
      return uids;
    } catch (e) {
      print('Error getting user UIDs: $e');
      return [];
    }
  }

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
        print("There are no products in $collectionName");
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
      final product = await dataBase.collection("products").get();
      List<ProductsModel> productsList = [];
      for (var element in product.docs) {
        productsList.add(ProductsModel.fromJson(map: element.data()));
      }
      print(productsList);
      return right(productsList);
    } catch (e) {
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
      productsModel = ProductsModel(
          id: productsModel.id,
          brand: productsModel.brand,
          name: productsModel.name,
          price: productsModel.price,
          imageUrl: productsModel.imageUrl,
          vendorId: productsModel.vendorId,
          description: productsModel.description);
      await productDoc.set(productsModel.toJson());
      return right(Appstate.productsUploaded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.code));
    }
  }
}
