part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class EmailVerificationSuccess extends RegisterState {}

class EmailVerificationLoading extends RegisterState {
  final String errMessage;

  EmailVerificationLoading({required this.errMessage});
}

class EmailVerificationFailure extends RegisterState {
  final String errMessage;

  EmailVerificationFailure({required this.errMessage});
}
