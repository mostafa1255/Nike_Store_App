import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final auth = FirebaseAuth.instance;
  GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
//Email and Password Auth
  void register({required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      print("in register function");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

  print(userCredential.user?.uid);

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(errMessage: '${e.message}'));
    }
  }

//Google Auth
  Future<UserCredential?> signInWithGoogle() async {
    emit(RegisterLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(RegisterSuccess());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(errMessage: e.message!));
      return null;
    }
  }

//is User Already Registered ?
  Future<bool> isUserAlreadyRegistered(String? email) async {
    if (email == null) {
      return false;
    }
    try {
      final result =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return result.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

//Verify Email
  Future<void> verifyEmail() async {
    try {
      auth.currentUser!.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

//Is Email Verified
  Future<void> isEmailVerified() async {
    if (auth.currentUser!.emailVerified) {
      emit(EmailVerificationSuccess());
    } else {
      emit(EmailVerificationFailure());
    }
  }
}
