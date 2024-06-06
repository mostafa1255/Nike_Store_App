part of 'image_picker_cubit.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

final class ImageSelectedLoading extends ImagePickerState {}

final class ImageSelectedSuccsess extends ImagePickerState {
  final String imageUrl;
  ImageSelectedSuccsess({required this.imageUrl});
}

final class ImageSelectedFaliure extends ImagePickerState {
  final String errMessage;
  
  ImageSelectedFaliure({required this.errMessage});
}
