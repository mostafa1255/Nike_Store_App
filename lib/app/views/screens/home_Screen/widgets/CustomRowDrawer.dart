import 'package:flutter/material.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../core/utils/AppFonts.dart';

class CustomElevatedButtonDrawer extends StatelessWidget {
  const CustomElevatedButtonDrawer({
    super.key,
    required this.widget,
    required this.text,
    this.onTap,
  });
  final Widget widget;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
          shadowColor: MaterialStatePropertyAll(Colors.transparent)),
      onPressed: onTap,
      child: Row(
        children: [
          widget,
          const HsizedBox(width: 20),
          Text(
            text,
            style: Txtstyle.style16(context: context)
                .copyWith(fontFamily: AppFonts.relwayFamily),
          ),
        ],
      ),
    );
  }
}
