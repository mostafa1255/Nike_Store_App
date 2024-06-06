import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/data/manager/image_picker_cubit/image_picker_cubit.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../data/models/User_Model.dart';
import '../../../data/repos/image_picker_repo/image_picker_repo_impl.dart';
import 'widgets/EditProfileScreenBody.dart';
import 'widgets/profileScreenAppBar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: profileScreenAppBar(context),
      body: BlocProvider(
        create: (context) =>
            ImagePickerCubit(imagePickerRepo: ImagePickerRepoImpl()),
        child:  EditProfileScreenBody(userModel: userModel,),
      ),
    );
  }
}
