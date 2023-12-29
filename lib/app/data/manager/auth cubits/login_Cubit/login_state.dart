part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

class EmailVerificationSuccess extends LoginState {}

class EmailVerificationLoading extends LoginState {
  final String errMessage;

  EmailVerificationLoading({required this.errMessage});
}

class EmailVerificationFailure extends LoginState {
  final String errMessage;

  EmailVerificationFailure({required this.errMessage});
}
