import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/tools/save_user_info.dart';
import '../../../core/errors/faliure.dart';
import '../../../core/errors/firebase_faliure.dart';
import '../../models/User_Model.dart';
import 'user_repo.dart';

class UserRepoImpl extends UserRepo {
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, UserModel>> getUserData() async {
    try {
      final userData =
          await dataBase.collection("users").doc(auth.currentUser!.uid).get();
      UserModel userModel = UserModel.fromJcon(data: userData.data()!);

      print("/" * 30);
      print(userModel.phoneNumber.toString());
      SaveUserInfo.saveUserEmail(userModel.email!);
      SaveUserInfo.saveUserName(userModel.name!);
      SaveUserInfo.saveUserPhone(userModel.phoneNumber.toString());
      SaveUserInfo.saveUserUid(auth.currentUser!.uid);
      return right(userModel);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }
}
