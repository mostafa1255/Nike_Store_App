import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final auth = FirebaseAuth.instance;

//Email and Password Auth
  void register({required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
