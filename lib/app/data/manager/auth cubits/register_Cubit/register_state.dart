part of 'register_cubit.dart';

@immutable
class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class EmailVerificationSuccess extends RegisterState {}

class EmailVerificationFailure extends RegisterState {}
