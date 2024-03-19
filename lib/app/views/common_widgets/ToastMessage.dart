import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/styles/App_Colors.dart';

class ToastMessage extends StatelessWidget {
  final String message;

  const ToastMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  void showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kPrimaryColor,
      textColor: Colors.white,
      fontSize: 14.sp,
    );
  }
}
