// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/data/repos/login_Repo/login_repo.dart';
import '../../../core/Functions/ensureNotVendorEmail.dart';
import '../../../core/Functions/googleCredential.dart';
import '../../../core/errors/firebase_faliure.dart';
import '../../../core/tools/reg_imp.dart';

class LoginRepoImpl extends LoginRepo {
  final auth = FirebaseAuth.instance;

  @override
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    QuerySnapshot query = await ensureNotVendorEmail(email: email);
    if (query.docs.length == 0) {
      try {
        print("in Login function");
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        print(userCredential.user?.uid);
        if (auth.currentUser!.emailVerified) {
          return right(userCredential);
        } else {
          return left(FirebaseFailure.fromFirebaseError(
              errorCode: "Email Not Verified , Please Verify Email"));
        }
      } on Exception catch (e) {
        if (e is FirebaseAuthException) {
          return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
        } else {
          return left(
              FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
        }
      }
    } else {
      return left(FirebaseFailure.fromFirebaseError(
          errorCode:
              "This Email Register in Vendor App, Please Login With User Email"));
    }
  }

  @override
  Future<Either<Faliures, UserCredential>> signInwithGoogle() async {
    try {
      final userCredential = await googleUserCredential();
      // Check if the user is new
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;
      if (isNewUser) {
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "You are not registered. Go to the register page."));
      } else {
        QuerySnapshot query =
            await ensureNotVendorEmail(email: userCredential.user!.email!);
        if (query.docs.length == 0) {
          return right(userCredential);
        } else {
          return left(FirebaseFailure.fromFirebaseError(
              errorCode:
                  "This Email Register in Vendor App, Please Login With User Email"));
        }
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

// reset password
  @override
  Future<Either<Faliures, void>> resetPassword({required String email}) async {
    try {
      if (email != "") {
        return right(await auth.sendPasswordResetEmail(email: email));
      }
      return left(
          FirebaseFailure.fromFirebaseError(errorCode: "Email is empty"));
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }
}
