import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/repos/image_picker_repo/image_picker_repo.dart';
part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit({required this.imagePickerRepo})
      : super(ImagePickerInitial());
  ImagePickerRepo imagePickerRepo;
  Future<void> getImageFromGalleryAndUploadtoStorage() async {
    emit(ImageSelectedLoading());
    var result = await imagePickerRepo.getImageFromGallery();
    result.fold((faliure) {
      emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
    }, (image) async {
      var result2 =
          await imagePickerRepo.uploadImageToStorage(userImage: image);
      result2.fold((faliure) {
        emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
      }, (imageurl) {
        emit(ImageSelectedSuccsess(imageUrl: imageurl));
      });
    });
  }

  Future<void> getImageFromCameraAndUploadtoStorage() async {
    emit(ImageSelectedLoading());
    var result = await imagePickerRepo.getImageFromCamera();
    result.fold((faliure) {
      emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
    }, (image) async {
      var result2 =
          await imagePickerRepo.uploadImageToStorage(userImage: image);
      result2.fold((faliure) {
        emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
      }, (imageurl) {
        emit(ImageSelectedSuccsess(imageUrl: imageurl));
      });
    });
  }
}
