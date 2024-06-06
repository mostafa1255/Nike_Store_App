import 'package:dartz/dartz.dart';
import '../../../core/errors/faliure.dart';
import '../../models/User_Model.dart';

abstract class UserRepo {
  Future<Either<Faliures, UserModel>> getUserData();
  Future<Either<Faliures, void>> updateImageUrl({required String imageUrl});
}
