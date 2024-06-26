import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackAndFavIcon extends StatelessWidget {
  const CustomBackAndFavIcon({
    super.key,
    this.onPressed,
    this.iconData,
  });
  final void Function()? onPressed;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20.r,
      child: IconButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
              width: 5.w,
              color: Colors.white,
            )),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
          iconSize: iconData == null ? 17.sp : 20.sp,
          onPressed: onPressed,
          icon: Icon(
            iconData ?? Icons.arrow_back_ios_rounded,
          )),
    );
  }
}
