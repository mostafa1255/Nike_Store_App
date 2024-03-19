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

class ResetPasswordLoading extends LoginState {}

class ResetPasswordsucsess extends LoginState {}

class ResetPasswordFailure extends LoginState {
  final String errMessage;

  ResetPasswordFailure({required this.errMessage});
}
