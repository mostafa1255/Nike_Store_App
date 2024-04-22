// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nike_store_app/app/core/Functions/ensureNotVendorEmail.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'package:nike_store_app/app/data/repos/register_Repo/register_repo.dart';
import '../../../core/Functions/googleCredential.dart';
import '../../models/User_Model.dart';

class RegisterRepoImpl extends Registerrepo {
  final auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
      print("in register function");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("google user is null");
        await googleSignIn.disconnect();
        return left(FirebaseFailure("Please Select Google Account"));
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;
      if (isNewUser) {
        print("user is new");
        await googleSignIn.disconnect();
        return right(userCredential);
      } else {
        //user not new
        print("user is not new");
        final query =
            await ensureNotVendorEmail(email: userCredential.user!.email!);
        if (query.docs.isEmpty) {
          await googleSignIn.disconnect();
          return left(FirebaseFailure("You Already Registered , Please Login"));
        } else {
          await googleSignIn.disconnect();
          return left(FirebaseFailure(
              "This Email is registered in the Vendor App. Please login with your user email."));
        }
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        print("error code : ${e.code}");
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

/*
* */

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
      phoneNumber: phoneNumber,
    );
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
