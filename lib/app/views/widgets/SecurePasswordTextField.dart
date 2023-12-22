import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/styles/App_Image.dart';
import 'CustomTextFormField.dart';

class SecurePasswordTextField extends StatefulWidget {
  const SecurePasswordTextField(
      {super.key, required this.passController, this.validator});
  final TextEditingController passController;
  final String? Function(String?)? validator;
  @override
  State<SecurePasswordTextField> createState() => _SecurePasswordState();
}

class _SecurePasswordState extends State<SecurePasswordTextField> {
  bool securPass = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      stringController: widget.passController,
      widget: IconButton(
          onPressed: () {
            setState(() {
              securPass = !securPass;
            });
          },
          icon: Image.asset(AppImages.iconeyePassword)),
      hinttext: "Password",
      securPass: securPass,
      width: double.infinity,
      height: 80.h,
    );
  }
}
