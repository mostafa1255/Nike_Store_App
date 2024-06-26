import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/utils/global_keys.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/utils/App_Regex.dart';
import '../../../../data/manager/auth cubits/register_Cubit/register_cubit.dart';
import '../../../common_widgets/CustomTextFormField.dart';
import '../../../common_widgets/SecurePasswordTextField.dart';
import '../../../common_widgets/VsizedBox.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({super.key});

  @override
  State<RegisterFormField> createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  @override
  Widget build(BuildContext context) {
    var regCubit = BlocProvider.of<RegisterCubit>(context);

    return Form(
        key: GlobalKeys.riKey2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Name",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.relwayFamily),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter correct name";
                }
              },
              stringController: regCubit.nameController,
              hinttext: "x x x x x x x ",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            const VsizedBox(height: 12),
            Text(
              "Email Address",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.relwayFamily),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return "Please enter your correct Email";
                }
              },
              stringController: regCubit.emailController,
              hinttext: "xyz@gmail.com",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            Text(
              "Phone Number",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.relwayFamily),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.hasNumber(value)) {
                  return "Please enter your correct Email";
                }
              },
              stringController: regCubit.phoneController,
              hinttext: "0123456789",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            const VsizedBox(height: 12),
            Text(
              "Password",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.relwayFamily),
            ),
            const VsizedBox(height: 8),
            SecurePasswordTextField(
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter correct Password";
                  } else if (!AppRegex.hasUpperCase(value) ||
                      !AppRegex.hasLowerCase(value) ||
                      !AppRegex.hasMinLength(value)) {
                    return "Password must have uppercase , lower case and 8 character ";
                  }
                },
                passController: regCubit.passController),
          ],
        ));
  }
}
