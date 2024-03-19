import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/errors/faliure.dart';
import '../../../core/errors/firebase_faliure.dart';
import '../../models/User_Model.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, UserModel>> getUserData() async {
    try {
      final userData =
          await dataBase.collection("users").doc(auth.currentUser!.uid).get();
      UserModel userModel = UserModel.fromJcon(data: userData.data()!);
      return right(userModel);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }
}
