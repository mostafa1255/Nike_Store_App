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

class UserInfoUploadedLoading extends RegisterState {}

class UserInfoUploadedSuccsess extends RegisterState {}

class UserInfoUploadedFaliure extends RegisterState {
  final String errMessage;

  UserInfoUploadedFaliure({required this.errMessage});
}
