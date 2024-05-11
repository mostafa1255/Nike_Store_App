import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/models/fcm_model.dart';
part 'fcm_state.dart';

class FcmCubit extends Cubit<FcmState> {
  FcmCubit() : super(FcmInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> getFCMProducts() async {
    emit(FcmLoading());
    List<FcmModel> productsList = [];
    try {
      final fcmProducts = await firestore
          .collection("fcm")
          .doc(auth.currentUser!.uid)
          .collection("product")
          .get();
      for (var product in fcmProducts.docs) {
        DateTime currentDateTime = DateTime.now();
        DateTime otherDateTime = DateTime.parse(product.data()["date"]);
        Duration difference = currentDateTime.difference(otherDateTime);
        productsList.add(FcmModel(
            productsModel:
                ProductsModel.fromJson(map: product.data()["productsModel"]),
            date: difference.inMinutes >= 60
                ? difference.inHours >= 24
                    ? "${difference.inDays} Days"
                    : "${difference.inHours} Hours"
                : "${difference.inMinutes} Minutes"));
      }
      if (fcmProducts.docs.isEmpty) {
        emit(GetFcmProductFailure(errMessage: "There is no notification yet"));
      } else {
        emit(GetFcmProductSuccsess(productsList: productsList));
      }
    } catch (e) {
      emit(GetFcmProductFailure(errMessage: e.toString()));
    }
  }

  Future<void> deleteAllNotification() async {
    try {
      final fcmProducts = await firestore
          .collection("fcm")
          .doc(auth.currentUser!.uid)
          .collection("product")
          .get();
      for (var doc in fcmProducts.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      // Handle any errors that occur during deletion
      print("Error deleting notifications: $e");
    }
  }
}
