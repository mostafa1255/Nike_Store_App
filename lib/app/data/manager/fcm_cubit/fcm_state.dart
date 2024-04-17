part of 'fcm_cubit.dart';

@immutable
sealed class FcmState {}

final class FcmInitial extends FcmState {}

class FcmLoading extends FcmState {}

class GetFcmProductSuccsess extends FcmState {
  final List<FcmModel> productsList;
  GetFcmProductSuccsess({required this.productsList});
}

class GetFcmProductFailure extends FcmState {
  final String errMessage;
  GetFcmProductFailure({required this.errMessage});
}
