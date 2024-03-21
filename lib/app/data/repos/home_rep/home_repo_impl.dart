import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'package:nike_store_app/app/core/tools/enums.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/vendors_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';
import '../../../core/tools/reg_imp.dart';

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
  Future<Either<Faliures, VendorModel>> getVendorsDataAndProducts() async {
    try {
      print("============================");
      final users = dataBase.collection("users").count();
      print(users);
      final vendorsAndProducts =
          await dataBase.collection("vendors").doc(auth.currentUser!.uid).get();
      // final userdata = vendorsAndProducts.data()!;
      vendorModel = VendorModel.fromMap(map: vendorsAndProducts.data()!);
      debugPrint("User name: ${vendorModel?.name}");
      return right(vendorModel!);
    } on FirebaseException catch (e) {
      print("Error Happien");
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, Appstate>> setVendorsDataAndProducts() async {
    vendorModel = VendorModel(
      email: "Mostafa@gmail.com",
      id: auth.currentUser!.uid,
      location: "[015,012]",
      name: "Mostafa",
      number: 01289880177,
    );
    try {
      print("-" * 30);
      final vendorCollection =
          dataBase.collection("vendors").doc(auth.currentUser!.uid);
      final productsdoc = vendorCollection.collection("products").doc();
      productsModel = ProductsModel(
          id: productsdoc.id,
          brand: "Testtttttttttt ",
          name: "Nike G.T. Cut 2",
          price: "200",
          imageUrl:
              "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/464f48a2-bde1-4264-aa7f-67cc60975ece/gt-cut-2-mens-basketball-shoes-tmfmFl.png",
          description: "Men's Basketball Shoes");
      vendorCollection.set(vendorModel!.toMap());
      productsdoc.set(productsModel!.toJson());
      return right(Appstate.productAddedToFavorites);
    } on Exception catch (e) {
      print("+" * 30);
      print(e.toString());
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
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
          productsList.add(ProductsModel.fromJson(doc.data()));
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
      final product = await dataBase.collection("products").get();
      List<ProductsModel> productsList = [];
      for (var element in product.docs) {
        productsList.add(ProductsModel.fromJson(element.data()));
      }
      print(productsList);
      return right(productsList);
    } catch (e) {
      // Handle the error here
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
    }
  }

/*Future<Either<Failures, ProductsModel>> getRandomProductForThreeDays() async {
  try {
    final productsEither = await getAllProducts();
    
    return productsEither.fold(
      (failure) => left(failure),
      (productsList) {
        if (productsList.isEmpty) {
          return left(EmptyListFailure());
        }
        
        // Generate a random index
        final random = Random();
        final randomIndex = random.nextInt(productsList.length);
        
        // Get the random product
        final randomProduct = productsList[randomIndex];
        
        // Check if the product was selected more than 3 days ago
        if (selectedProducts.containsKey(randomProduct)) {
          final lastSelected = selectedProducts[randomProduct];
          final now = DateTime.now();
          final difference = now.difference(lastSelected).inDays;
          if (difference < 3) {
            // If less than 3 days have passed, select a different product
            return getRandomProductForThreeDays();
          }
        }
        
        // Keep track of the selected product and the timestamp
        selectedProducts[randomProduct] = DateTime.now();
        
        return right(randomProduct);
      }
    );
  } catch (e) {
    // Handle the error here
    return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
  }
}

*/

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
          description: productsModel.description);
      await productDoc.set(productsModel.toJson());
      return right(Appstate.productsUploaded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.code));
    }
  }


}
