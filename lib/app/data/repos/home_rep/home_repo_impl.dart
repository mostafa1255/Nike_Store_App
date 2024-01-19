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
        // Access the UID field in each document and add it to the uids list
        uids.add(doc.id);
      }

      // Return the list of UIDs
      return uids;
    } catch (e) {
      // Handle any errors that occur
      print('Error getting user UIDs: $e');
      return [];
    }
  }

  @override
  Future<Either<Faliures, VendorModel>> getVendorsDataAndProducts() async {
    try {
      print("============================");
      final users = await dataBase.collection("users").count();
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
  Future<Either<Faliures, void>> setVendorsDataAndProducts() async {
    vendorModel = VendorModel(
      email: "Mostafa@gmail.com",
      id: auth.currentUser!.uid,
      location: "[015,012]",
      name: "Mostafa",
      number: 01289880177,
    );
    productsModel = ProductsModel(
        brand: "Nike ",
        name: "Nike G.T. Cut 2",
        price: 200,
        imageUrl:
            "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/464f48a2-bde1-4264-aa7f-67cc60975ece/gt-cut-2-mens-basketball-shoes-tmfmFl.png",
        description: "Men's Basketball Shoes");
    try {
      final vendorCollection = dataBase.collection("vendors").doc();
      vendorCollection.set(vendorModel!.toMap());
      vendorCollection
          .collection("products")
          .doc()
          .set(productsModel!.toJson());
      return right(await dataBase
          .collection("vendors")
          .doc(auth.currentUser!.uid)
          .set(vendorModel!.toMap()));
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliures, void>> addToFavouritesProducts({
    required String brand,
    required String name,
    required num price,
    required String imageUrl,
    required String description,
  }) async {
    productsModel = ProductsModel(
        brand: brand,
        name: name,
        price: price,
        imageUrl: imageUrl,
        description: description);
    try {
      print("-" * 70);

      await dataBase
          .collection("favorites")
          .doc(auth.currentUser!.uid)
          .collection("products")
          .doc()
          .set(productsModel!.toJson());
      // ignore: void_checks
      return right(Appstate.productsUploaded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.code));
    }
  }

  @override
  Future<Either<Faliures, List<ProductsModel>>> getFavouritesProducts() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await dataBase
          .collection("favorites")
          .doc(auth.currentUser!.uid)
          .collection("products")
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<ProductsModel> favouriteProductsList = [];
        snapshot.docs.forEach((doc) {
          favouriteProductsList.add(ProductsModel.fromJson(doc.data()));
        });
        favouriteProductsList.forEach((product) {
          print(product.brand);
          print(product.name);
          print(product.price);
          print(favouriteProductsList.length);
        });
        return right(favouriteProductsList);
      } else {
        return left(FirebaseFailure(Appstate.userUIdNotFound.toString()));
      }
    } on FirebaseException catch (e) {
      print("Error Happened in getFavouritesProducts: ${e.message}");
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }
}
