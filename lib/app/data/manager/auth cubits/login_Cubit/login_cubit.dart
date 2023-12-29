import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/repos/login_Repo/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final auth = FirebaseAuth.instance;
  LoginRepo loginRepo;
  UserCredential? userCredential;
  GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<void> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoading());
    var result = await loginRepo.signInwithEmailandPassword(
        email: email, password: password, context: context);
    result.fold((faliure) {
      emit(LoginFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      userCredential = usercredential;
      emit(LoginSuccess());
    });
  }

//Google Auth
  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await loginRepo.signInwithGoogle();
    result.fold((faliure) {
      emit(LoginFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      userCredential = usercredential;
      emit(LoginSuccess());
    });
  }

  Future<void> isEmailVerified() async {
    try {
      if (auth.currentUser!.emailVerified) {
        emit(EmailVerificationSuccess());
      } else {
        auth.currentUser!.sendEmailVerification();
        emit(EmailVerificationLoading(errMessage: "please verify your email"));
      }
    } on FirebaseAuthException catch (e) {
      emit(EmailVerificationFailure(errMessage: e.message.toString()));
    }
  }
}
