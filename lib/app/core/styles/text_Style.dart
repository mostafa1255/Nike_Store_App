import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/constants.dart';

class Txtstyle {
  static TextStyle style34({required BuildContext context}) {
    return TextStyle(
        fontFamily: Constants.relwayFamily,
        fontSize: 34.sp,
        color: Colors.white);
  }

  static TextStyle style30({required BuildContext context}) {
    return TextStyle(
        fontFamily: Constants.relwayFamily,
        fontSize: 30.sp,
        color: Colors.white);
  }

  static TextStyle style25({required BuildContext context}) {
    return TextStyle(
        fontFamily: Constants.relwayFamily,
        fontSize: 25.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold);
  }

  static TextStyle style22({required BuildContext context}) {
    return TextStyle(
        fontFamily: Constants.relwayFamily,
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold);
  }

  static TextStyle style16({required BuildContext context}) {
    return TextStyle(
        fontSize: 16.sp,
        fontFamily: Constants.popinsFamily,
        color: Colors.white);
  }

  static TextStyle style14({required BuildContext context}) {
    return TextStyle(
        fontSize: 14.sp,
        fontFamily: Constants.popinsFamily,
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle style12({required BuildContext context}) {
    return TextStyle(
        fontSize: 12.sp,
        fontFamily: Constants.popinsFamily,
        color: Colors.white);
  }

  static TextStyle style8({required BuildContext context}) {
    return TextStyle(
        fontSize: 8.sp,
        fontFamily: Constants.popinsFamily,
        color: Colors.white);
  }
}
