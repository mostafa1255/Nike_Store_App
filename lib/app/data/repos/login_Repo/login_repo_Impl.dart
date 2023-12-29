import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/login_Cubit/login_cubit.dart';
import 'package:nike_store_app/app/data/repos/login_Repo/login_repo.dart';
import '../../../core/errors/firebase_faliure.dart';
import '../../../core/tools/reg_imp.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print("in register function");
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user?.uid);
      await BlocProvider.of<LoginCubit>(context).isEmailVerified();
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
  Future<Either<Faliures, UserCredential>> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is new
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;

      if (isNewUser) {
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "You are not registered. Go to the register page."));
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
}
