import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle(
    {required void Function() emitFunctionLoading,
    required void Function() emitFunctionSucsess,
    required void Function({required String errMessage})
        emitFunctionFailure}) async {
  emitFunctionLoading();
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    emitFunctionSucsess();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    emitFunctionFailure(errMessage: e.message.toString());
    return null;
  }
}
