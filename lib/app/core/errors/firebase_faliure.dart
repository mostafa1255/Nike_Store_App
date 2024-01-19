import 'package:nike_store_app/app/core/errors/faliure.dart';

class FirebaseFailure extends Faliures {
  FirebaseFailure(
    String errorMessage,
  ) : super(errorMessage);

  factory FirebaseFailure.fromFirebaseError({required String errorCode}) {
    String getMessageFromErrorCode() {
      switch (errorCode) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          return "Email already used. Go to the login page.";

        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          return "Wrong email / password must have at least 8 characters.";

        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          return "No user found with this email.";

        case "ERROR_USER_DISABLED":
        case "user-disabled":
          return "User disabled.";

        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          return "Too many requests to log into this account.";

        case "ERROR_OPERATION_NOT_ALLOWED":
          return "Server error, please try again later.";

        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          return "Email address is invalid.";

        default:
          return errorCode;
      }
    }

    return FirebaseFailure(getMessageFromErrorCode());
  }
}
