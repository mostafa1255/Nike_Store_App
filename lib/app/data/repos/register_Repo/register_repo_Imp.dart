// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'package:nike_store_app/app/data/repos/register_Repo/register_repo.dart';
import '../../../core/Functions/googleCredential.dart';
import '../../models/User_Model.dart';

class RegisterRepoImpl extends Registerrepo {
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, UserCredential>> signUpwithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      print("in register function");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user?.uid);
      auth.currentUser!.sendEmailVerification();
      return right(userCredential);
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliures, UserCredential>> signUpwithGoogle() async {
    try {
      final userCredential = await googleUserCredential();
      // Check if the user is new
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;
      if (!isNewUser) {
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "Email already used, Go to the login page"));
      } else {
        return right(userCredential);
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliures, void>> sendUserInfotoFirestore({
    required String name,
    required String email,
    required String userid,
    required String imageUrl,
    required int phoneNumber,
  }) async {
    UserModel usermodel = UserModel(
        email: email,
        userid: userid,
        name: name,
        imageUrl: "",
        phoneNumber: phoneNumber);
    try {
      return right(await FirebaseFirestore.instance
          .collection("users")
          .doc(userid)
          .set(usermodel.toJcon()));
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }
}
