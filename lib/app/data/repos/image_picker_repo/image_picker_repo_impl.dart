import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:nike_store_app/app/core/errors/faliure.dart';
import 'package:nike_store_app/app/core/errors/firebase_faliure.dart';
import 'image_picker_repo.dart';

class ImagePickerRepoImpl extends ImagePickerRepo {
  File? userImage;

  @override
  Future<Either<Faliures, File>> getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      return right(userImage!);
    } else {
      return left(FirebaseFailure("Please Select Image"));
    }
  }

  @override
  Future<Either<Faliures, File>> getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      return right(userImage!);
    } else {
      return left(FirebaseFailure("Please Select Image"));
    }
  }

  @override
  Future<Either<Faliures, String>> uploadImageToStorage(
      {required File userImage}) async {
    try {
      debugPrint("File is : $userImage");
      debugPrint("Base name is : ${basename(userImage.path)}");
      Reference imageref =
          FirebaseStorage.instance.ref(basename(userImage.path));

      await imageref.putFile(userImage);
      return right(await imageref.getDownloadURL());
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }
}
