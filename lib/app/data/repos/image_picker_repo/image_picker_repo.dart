import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';

abstract class ImagePickerRepo {
  Future<Either<Faliures, File>> getImageFromGallery();
  Future<Either<Faliures, File>> getImageFromCamera();
  Future<Either<Faliures, String>> uploadImageToStorage(
      {required File userImage});
}
