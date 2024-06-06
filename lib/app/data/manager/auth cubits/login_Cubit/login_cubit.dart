import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/core/tools/save_user_info.dart';
import 'package:nike_store_app/app/data/repos/login_Repo/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final auth = FirebaseAuth.instance;
  LoginRepo loginRepo;
  UserCredential? userCredential;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<void> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    print("in login function");
    emit(LoginLoading());
    var result = await loginRepo.signInwithEmailandPassword(
        email: email, password: password, context: context);
    result.fold((faliure) {
      print("in login function ${faliure.errmessage}");
      emit(LoginFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      if (auth.currentUser!.emailVerified) {
        userCredential = usercredential;

        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errMessage: "Please Verify Your Email"));
      }
      Future.delayed(const Duration(seconds: 2)).then((_) {
        emailController.clear();
        passController.clear();
      });
    });
  }

//Google Auth
  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await loginRepo.signInwithGoogle();
    result.fold((faliure) {
      emit(LoginFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      emit(LoginSuccess());
    });
  }

// reset password
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    var result = await loginRepo.resetPassword(email: email);
    result.fold((faliure) {
      emit(ResetPasswordFailure(errMessage: faliure.errmessage));
    }, (voidreturn) {
      emit(ResetPasswordsucsess());
    });
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.disconnect();
      await googleSignIn.signOut();
      SaveUserInfo.deleteUserInfo();
    } catch (e) {
      print("Error disconnecting from Google: $e");
    }
  }
}
