import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';

class FavoriteIconAction extends StatefulWidget {
  const FavoriteIconAction({super.key, required this.favProduct});
  final ProductsModel favProduct;

  @override
  State<FavoriteIconAction> createState() => _FavoriteIconActionState();
}

class _FavoriteIconActionState extends State<FavoriteIconAction> {
  bool isPressed = false;
  List<ProductsModel> favProducts = [];
  @override
  Widget build(BuildContext context) {
    if (isPressed == false) {
      return IconButton(
          onPressed: () {
            setState(() {
              favProducts.add(widget.favProduct);
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
