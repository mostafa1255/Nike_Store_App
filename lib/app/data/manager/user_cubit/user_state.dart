part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class FetchUserDataLoading extends UserState {}

final class FetchUserDataSuccess extends UserState {
  final UserModel userModel;
  FetchUserDataSuccess({required this.userModel});
}

final class FetchUserDataFailure extends UserState {
  final String errMessage;
  FetchUserDataFailure({required this.errMessage});
}

final class UpdateUserDataFailure extends UserState {
  final String errMessage;
  UpdateUserDataFailure({required this.errMessage});
}
