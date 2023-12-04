import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteIconAction extends StatefulWidget {
  const FavoriteIconAction({super.key});

  @override
  State<FavoriteIconAction> createState() => _FavoriteIconActionState();
}

class _FavoriteIconActionState extends State<FavoriteIconAction> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    if (isPressed == false) {
      return IconButton(
          onPressed: () {
            setState(() {
              isPressed = true;
            });
          },
          icon: Icon(
            Icons.favorite_border_outlined,
            size: 20.sp,
          ));
    } else {
      return IconButton(
          onPressed: () {
            setState(() {
              isPressed = false;
            });
          },
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 20.sp,
          ));
    }
    ;
  }
}
