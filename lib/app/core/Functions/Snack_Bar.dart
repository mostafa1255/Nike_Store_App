import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';

Future<void> customsnackBar(BuildContext context, String messgae, Color color) {
  return Future.delayed(const Duration(seconds: 1), () {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        messgae,
        style: Txtstyle.style12(context: context),
      ),
      backgroundColor: color,
    ));
  });
}
